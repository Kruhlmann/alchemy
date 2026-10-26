use std::{path::Path, process::Command};

use crate::assembly::Assembly;

pub struct Assembler;

fn exec(command: &mut Command) -> std::io::Result<()> {
    let output = command.output()?;
    if !output.status.success() {
        return Err(std::io::Error::other(format!(
            "{command:?} failed ({}):\n{}",
            output.status,
            String::from_utf8_lossy(&output.stderr),
        )));
    }

    Ok(())
}

impl Assembler {
    pub fn assemble(assembly: &Assembly, executable: &Path, keep_asm: bool) -> std::io::Result<()> {
        let Assembly(source_code) = assembly;
        let temp = tempfile::tempdir()
            .inspect_err(|error| tracing::error!(?error, "create temporary directory"))?;
        let asm = if keep_asm {
            let path = std::env::current_dir()
                .inspect_err(|error| {
                    tracing::error!(?error, "could not place asm file in working dir")
                })?
                .join("alchemy-program.asm");
            tracing::info!(?path, "keeping asm in current working directory");
            path
        } else {
            temp.path().join("program.asm")
        };
        let object = temp.path().join("program.o");

        std::fs::write(&asm, source_code)
            .inspect_err(|error| tracing::error!(?error, file = ?asm, "write source"))?;

        let mut nasm_cmd = Command::new("nasm");
        let nasm_cmd = nasm_cmd
            .arg("-f")
            .arg("elf64")
            // TODO make optional
            .arg("-g")
            .arg("-F")
            .arg("dwarf")
            .arg(&asm)
            .arg("-o")
            .arg(&object);
        exec(nasm_cmd).inspect_err(|error| {
            // TODO: tempfix for debugging
            tracing::error!(?error, file = ?asm, "execute nasm, wrote assembly to /tmp/program.asm");
            std::fs::write(Path::new("/tmp/program.asm"), source_code).unwrap();
        })?;

        let mut ld_cmd = Command::new("ld");
        let ld_cmd = ld_cmd.arg(&object).arg("-o").arg(executable);
        exec(ld_cmd).inspect_err(|error| {
            tracing::error!(?object, ?executable, ?error, "link object to executable")
        })?;

        Ok(())
    }
}
