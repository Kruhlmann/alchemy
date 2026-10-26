use alchemy_rs::compiler::Compiler;
use clap::Parser;
use std::{
    path::{Path, PathBuf},
    process::Command,
};

use tracing_subscriber::EnvFilter;

#[derive(Debug, Parser)]
#[command(version, about)]
pub struct Args {
    #[arg(short)]
    pub input: PathBuf,
    #[arg(short)]
    pub output: PathBuf,
    #[arg(short = 'I', long = "include")]
    pub extra_includes: Vec<PathBuf>,
    #[arg(long)]
    pub run: bool,
    #[arg(long)]
    pub keep_asm: bool,
}

pub fn main() {
    let env_filter = EnvFilter::try_from_default_env().unwrap_or_else(|_| EnvFilter::new("debug"));
    tracing_subscriber::fmt().with_env_filter(env_filter).init();
    let args = Args::parse();
    let default_includes = vec![
        std::env::current_dir()
            .inspect_err(|error| tracing::error!(?error, "no working directory"))
            .unwrap_or_else(|_| std::process::exit(1)),
        Path::new("/usr/share/alchemy/lib").to_path_buf(),
    ];
    let includes: Vec<_> = default_includes
        .into_iter()
        .chain(args.extra_includes)
        .collect();
    Compiler::new(includes)
        .compile(&args.input, &args.output, args.keep_asm)
        .inspect_err(|error| tracing::error!(%error, "compiler error"))
        .unwrap_or_else(|_| std::process::exit(1));

    if args.run {
        let executable = args
            .output
            .canonicalize()
            .expect("Failed to resolve output executable");

        tracing::info!(program = %executable.display(), "running program");

        match Command::new(&executable).status() {
            Ok(status) => {
                std::process::exit(status.code().unwrap_or(1));
            }
            Err(error) => {
                tracing::error!(?error, program = %executable.display(), "execution failed");
                std::process::exit(1);
            }
        }
    }
}
