use std::{
    collections::{BTreeMap, HashSet},
    ffi::OsStr,
    path::{Path, PathBuf},
};

pub mod error;
pub mod source;

pub use error::*;
pub use source::*;

pub struct Resolver<'a>(&'a [PathBuf]);

impl<'a> Resolver<'a> {
    pub fn new(paths: &'a [PathBuf]) -> Self {
        Self(paths)
    }

    pub fn resolve_includes(
        &self,
        source_code: &str,
        source_file: &Path,
    ) -> Result<ResolvedSourceCode, ResolverError> {
        fn expand(
            source: &str,
            source_file: &Path,
            modules: &BTreeMap<String, PathBuf>,
            included: &mut HashSet<PathBuf>,
            files: &mut FileTable,
        ) -> Result<Vec<ResolvedSourceCodeLine>, ResolverError> {
            let file = files.intern(source_file.to_path_buf());
            let mut output = Vec::new();

            for (line_index, line) in source.split_inclusive('\n').enumerate() {
                let mut words = line.split_whitespace();

                match (words.next(), words.next(), words.next()) {
                    (Some("include"), Some(name), None) => {
                        let path = modules.get(name).ok_or_else(|| {
                            ResolverError::ModuleNotFound(name.to_string(), modules.clone())
                        })?;

                        let path = std::fs::canonicalize(path)?;

                        if included.insert(path.clone()) {
                            let source = std::fs::read_to_string(&path)?;

                            let expanded = expand(&source, &path, modules, included, files)?;

                            output.extend(expanded);
                        }
                    }

                    _ => {
                        output.push(ResolvedSourceCodeLine {
                            file,
                            line: line_index + 1,
                            text: line.to_owned(),
                        });
                    }
                }
            }

            Ok(output)
        }

        let source_file = std::fs::canonicalize(source_file)?;
        let modules = self.discover_modules()?;
        let mut files = FileTable::default();

        let mut included = HashSet::new();
        included.insert(source_file.clone());

        let lines = expand(
            source_code,
            &source_file,
            &modules,
            &mut included,
            &mut files,
        )?;

        Ok(ResolvedSourceCode { files, lines })
    }

    fn discover_modules(&self) -> Result<BTreeMap<String, PathBuf>, ResolverError> {
        fn visit(
            root: &Path,
            dir: &Path,
            modules: &mut BTreeMap<String, PathBuf>,
        ) -> std::io::Result<()> {
            match std::fs::exists(dir) {
                Ok(true) => {}
                Ok(false) => {
                    tracing::warn!(?dir, "include directory does not exist, skipping");
                    return Ok(());
                }
                Err(error) => {
                    tracing::warn!(
                        ?error,
                        ?dir,
                        "could not determin if include directory exist, skipping"
                    );
                    return Ok(());
                }
            }
            let mut entries = std::fs::read_dir(dir)?.collect::<Result<Vec<_>, _>>()?;
            entries.sort_by_key(|entry| entry.file_name());

            for entry in entries {
                let path = entry.path();
                let file_type = match entry.file_type() {
                    Ok(ft) => ft,
                    Err(error) => {
                        tracing::warn!(?error, ?entry, "get file type, skipping");
                        continue;
                    }
                };

                if file_type.is_dir() {
                    visit(root, &path, modules)?;
                } else if file_type.is_file() && path.extension() == Some(OsStr::new("alc")) {
                    let relative = path.strip_prefix(root).expect("path is under root");
                    let name = relative
                        .with_extension("")
                        .components()
                        .map(|part| part.as_os_str().to_string_lossy().into_owned())
                        .collect::<Vec<_>>()
                        .join(".");

                    if let Some(previous) = modules.insert(name.clone(), path.clone()) {
                        tracing::warn!(
                            module = %name,
                            previous = %previous.display(),
                            replacement = %path.display(),
                            "module collision"
                        );
                    }
                }
            }

            Ok(())
        }

        let mut modules = BTreeMap::new();

        for root in self.0 {
            visit(root, root, &mut modules)?;
        }

        Ok(modules)
    }
}
