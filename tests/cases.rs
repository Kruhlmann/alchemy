use std::{path::Path, process::Command, sync::Once};

use alchemy::compiler::Compiler;
use tracing_subscriber::EnvFilter;

pub struct AlchemyRunner<'a> {
    source: &'a str,
    expected_stdout: Option<String>,
    expected_stderr: Option<String>,
    exit_code: Option<i32>,
}

impl<'a> AlchemyRunner<'a> {
    pub fn run_test_from_directory(case_dir: &Path) -> Result<(), Box<dyn std::error::Error>> {
        let source_file = case_dir.join("source.alc");
        let exit_code_file = case_dir.join("exit_code");
        let stdout_file = case_dir.join("stdout");
        let stderr_file = case_dir.join("stderr");

        let source = std::fs::read_to_string(source_file)?;
        let mut runner = AlchemyRunner::new(&source);
        if let Some(exit_code) = std::fs::read_to_string(exit_code_file)
            .map(|c| c.trim().parse::<i32>().unwrap())
            .ok()
        {
            runner = runner.expect_exit_code(exit_code);
        }
        if let Some(stdout) = std::fs::read_to_string(stdout_file).ok() {
            runner = runner.expect_stdout(stdout);
        }
        if let Some(stderr) = std::fs::read_to_string(stderr_file).ok() {
            runner = runner.expect_stderr(stderr);
        }

        runner.run_and_validate(case_dir)?;
        Ok(())
    }

    fn run_and_validate(&self, case_dir: &Path) -> Result<(), Box<dyn std::error::Error>> {
        let workdir = tempfile::tempdir()?;
        let source_file = workdir.path().join("program.asm");
        let executable_file = workdir.path().join("program");

        std::fs::write(&source_file, &self.source)?;
        let cargo_dir = Path::new(env!("CARGO_MANIFEST_DIR")).to_path_buf();
        Compiler::new(vec![cargo_dir.join("lib"), cargo_dir.join(case_dir)])
            .compile(&source_file, &executable_file, false)
            .inspect_err(|error| tracing::error!(%error, "compiler error"))?;

        let output = Command::new(&executable_file)
            .output()
            .expect("failed to execute program");

        if let Some(code) = self.exit_code {
            assert_eq!(Some(code), output.status.code(), "exit code differ");
        }
        if let Some(stdout) = &self.expected_stdout {
            assert!(
                stdout.as_bytes() == output.stdout,
                "stdout differs\nexpected: {:?}\n  actual: {:?}",
                stdout,
                String::from_utf8_lossy(&output.stdout),
            );
        }
        if let Some(stderr) = &self.expected_stderr {
            assert!(
                stderr.as_bytes() == output.stderr,
                "stderr differs\nexpected: {:?}\n  actual: {:?}",
                stderr,
                String::from_utf8_lossy(&output.stderr),
            );
        }

        Ok(())
    }

    fn new(source: &'a str) -> Self {
        Self {
            source,
            expected_stdout: None,
            expected_stderr: None,
            exit_code: None,
        }
    }

    fn expect_exit_code(self, exit_code: i32) -> Self {
        Self {
            source: self.source,
            expected_stdout: self.expected_stdout,
            expected_stderr: self.expected_stderr,
            exit_code: Some(exit_code),
        }
    }

    fn expect_stdout(self, expected_output: String) -> Self {
        Self {
            source: self.source,
            expected_stdout: Some(expected_output),
            expected_stderr: self.expected_stderr,
            exit_code: self.exit_code,
        }
    }

    fn expect_stderr(self, expected_output: String) -> Self {
        Self {
            source: self.source,
            expected_stdout: self.expected_stdout,
            expected_stderr: Some(expected_output),
            exit_code: self.exit_code,
        }
    }
}

fn init_tracing() {
    static INIT: Once = Once::new();
    INIT.call_once(|| {
        let env_filter =
            EnvFilter::try_from_default_env().unwrap_or_else(|_| EnvFilter::new("debug"));
        tracing_subscriber::fmt().with_env_filter(env_filter).init();
    });
}

fn test_case(source: &Path) -> datatest_stable::Result<()> {
    init_tracing();
    AlchemyRunner::run_test_from_directory(source.parent().unwrap())
}

datatest_stable::harness! {
    {
        test = test_case,
        root = "tests/cases",
        pattern = r"(^|/)source\.alc$",
    },
}
