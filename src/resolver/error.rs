use std::{collections::BTreeMap, path::PathBuf};

#[derive(Debug)]
pub enum ResolverError {
    ModuleNotFound(String, BTreeMap<String, PathBuf>),
    IoError(std::io::Error),
}

impl std::fmt::Display for ResolverError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ResolverError::ModuleNotFound(module, search_dirs) => {
                write!(f, "module {module} not found, searched {search_dirs:#?}")
            }
            ResolverError::IoError(error) => write!(f, "resolver io error: {error}"),
        }
    }
}

impl std::error::Error for ResolverError {}

impl From<std::io::Error> for ResolverError {
    fn from(value: std::io::Error) -> Self {
        ResolverError::IoError(value)
    }
}
