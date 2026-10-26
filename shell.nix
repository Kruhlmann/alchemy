{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.cargo-llvm-cov
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.nasm
  ];
}
