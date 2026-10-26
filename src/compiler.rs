use std::path::{Path, PathBuf};

use crate::{
    assembly::{Assembler, AssemblyGenerator, AssemblyOptimizer},
    lexer::Lexer,
    linker::Linker,
    resolver::Resolver,
};

pub struct Compiler {
    include_paths: Vec<PathBuf>,
}

impl Compiler {
    pub fn new(include_paths: Vec<PathBuf>) -> Self {
        Self { include_paths }
    }

    pub fn compile(
        &self,
        source_file: &Path,
        output_file: &Path,
        keep_asm: bool,
    ) -> Result<(), Box<dyn std::error::Error>> {
        tracing::info!(
            ?source_file,
            ?output_file,
            include_paths = ?self.include_paths,
            "compiling"
        );
        let unresolved_source_code = std::fs::read_to_string(source_file)?;
        let resolved_source_code = Resolver::new(self.include_paths.as_slice())
            .resolve_includes(&unresolved_source_code)?;
        let unlinked_tokens = Lexer::lex_source_code_stdin(&resolved_source_code)?;
        let linked_tokens = Linker::link_tokens(unlinked_tokens)?;
        let raw_asm = AssemblyGenerator::generate(&linked_tokens);
        let asm = AssemblyOptimizer::optimize(&raw_asm);
        Assembler::assemble(&asm, output_file, keep_asm)?;
        Ok(())
    }
}
