# Copyright (c) Siemens Mobility A/S 2024, All Rights Reserved - CONFIDENTIAL
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_22
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.vscode-json-languageserver
    pkgs.nasm
  ];
}
