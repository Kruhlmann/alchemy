use std::{
    collections::HashMap,
    path::{Path, PathBuf},
};

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct FileId(pub usize);

#[derive(Debug, Clone, Default)]
pub struct FileTable {
    paths: Vec<PathBuf>,
    ids: HashMap<PathBuf, FileId>,
}

impl FileTable {
    pub fn intern(&mut self, path: PathBuf) -> FileId {
        if let Some(&id) = self.ids.get(&path) {
            return id;
        }

        let id = FileId(self.paths.len());
        self.paths.push(path.clone());
        self.ids.insert(path, id);
        id
    }

    pub fn path(&self, id: FileId) -> &Path {
        &self.paths[id.0]
    }
}

#[derive(Debug, Clone)]
pub struct ResolvedSourceCodeLine {
    pub file: FileId,
    pub line: usize,
    pub text: String,
}

#[derive(Debug, Clone)]
pub struct ResolvedSourceCode {
    pub files: FileTable,
    pub lines: Vec<ResolvedSourceCodeLine>,
}
