use std::{
    io::{Read, Write},
    net::{Shutdown, TcpListener},
    path::Path,
    process::{Command, Stdio},
    thread,
    time::{Duration, Instant},
};

use alchemyc::compiler::Compiler;

fn run_client(source: &str, expected_stdout: &str) {
    let workdir = tempfile::tempdir().unwrap();
    let source_file = workdir.path().join("socket.alc");
    let executable = workdir.path().join("socket");
    std::fs::write(&source_file, source).unwrap();
    Compiler::new(vec![Path::new(env!("CARGO_MANIFEST_DIR")).join("lib")])
        .compile(&source_file, &executable, false)
        .unwrap();

    let mut child = Command::new(executable)
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    let deadline = Instant::now() + Duration::from_secs(10);
    loop {
        if child.try_wait().unwrap().is_some() {
            break;
        }
        if Instant::now() >= deadline {
            let _ = child.kill();
            let output = child.wait_with_output().unwrap();
            panic!("socket client timed out: {output:?}");
        }
        thread::sleep(Duration::from_millis(5));
    }
    let output = child.wait_with_output().unwrap();
    assert!(output.status.success(), "socket client failed: {output:?}");
    assert_eq!(output.stdout, expected_stdout.as_bytes());
    assert!(output.stderr.is_empty(), "unexpected stderr: {output:?}");
}

fn ping_server(listener: TcpListener) -> thread::JoinHandle<()> {
    listener.set_nonblocking(true).unwrap();
    thread::spawn(move || {
        let deadline = Instant::now() + Duration::from_secs(10);
        let mut stream = loop {
            match listener.accept() {
                Ok((stream, _)) => break stream,
                Err(error) if error.kind() == std::io::ErrorKind::WouldBlock => {
                    assert!(Instant::now() < deadline, "server accept timed out");
                    thread::sleep(Duration::from_millis(5));
                }
                Err(error) => panic!("server accept failed: {error}"),
            }
        };
        stream
            .set_read_timeout(Some(Duration::from_secs(5)))
            .unwrap();
        stream
            .set_write_timeout(Some(Duration::from_secs(5)))
            .unwrap();
        let mut request = [0; 4];
        stream.read_exact(&mut request).unwrap();
        assert_eq!(&request, b"ping");
        stream.write_all(b"pong").unwrap();
        stream.shutdown(Shutdown::Write).unwrap();
        let mut remaining = Vec::new();
        stream.read_to_end(&mut remaining).unwrap();
        assert!(remaining.is_empty());
    })
}

#[test]
fn socket_demo_round_trip() {
    let listener = TcpListener::bind(("127.0.0.1", 0)).unwrap();
    let port = listener.local_addr().unwrap().port();
    let server = ping_server(listener);
    let source = include_str!("../socket_test.alc").replace(
        "8080 socket_connect_ipv4",
        &format!("{port} socket_connect_ipv4"),
    );
    run_client(&source, "received pong\n");
    server.join().unwrap();
}

#[test]
fn socket_byte_reads_and_eof() {
    let listener = TcpListener::bind(("127.0.0.1", 0)).unwrap();
    let port = listener.local_addr().unwrap().port();
    let server = ping_server(listener);
    let source = format!(
        r#"
include std.net.socket
include std.net.ipv4
include std.io

sub assert
    swap 0 = if 1 exit endif
marine

sub main
    12345
    socket_tcp
    clone 0 >= assert
    clone "127.0.0.1" ipv4_parse {port} socket_connect_ipv4 0 = assert
    clone "p" 1 socket_write 1 = assert
    clone "i" 1 socket_write 1 = assert
    clone "n" 1 socket_write 1 = assert
    clone "g" 1 socket_write 1 = assert
    1 mem_alloc
    clone 0 > assert
    clone2 0 socket_read 0 = assert
    clone2 1 socket_read 1 = assert
    clone * 112 = assert
    clone2 1 socket_read 1 = assert
    clone * 111 = assert
    clone2 1 socket_read 1 = assert
    clone * 110 = assert
    clone2 1 socket_read 1 = assert
    clone * 103 = assert
    clone2 1 socket_read 0 = assert
    1 mem_free 0 = assert
    clone 1 swap SYS_SHUTDOWN syscall2 0 = assert
    clone "x" 1 socket_write -32 = assert
    socket_close 0 = assert
    12345 = assert
    "socket IO ok" println
marine
"#
    );
    run_client(&source, "socket IO ok\n");
    server.join().unwrap();
}
