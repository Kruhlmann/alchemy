{
  description = "Alchemy compiler";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      cargo = builtins.fromTOML (builtins.readFile ./Cargo.toml);
    in
    {
      packages.${system}.default = pkgs.rustPlatform.buildRustPackage {
        pname = "alchemyc";
        version = cargo.package.version;
        src = pkgs.lib.cleanSource ./.;
        cargoLock.lockFile = ./Cargo.lock;

        nativeBuildInputs = [
          pkgs.makeWrapper
          pkgs.nasm
          pkgs.binutils
        ];

        preBuild = ''
          export ALCHEMY_LIB_DIR="$out/share/alchemy/lib"
        '';

        postInstall = ''
          mkdir -p "$out/share/alchemy/lib"
          cp -r lib/std "$out/share/alchemy/lib/std"

          for executable in "$out"/bin/*; do
            wrapProgram "$executable" \
              --prefix PATH : "${
                pkgs.lib.makeBinPath [
                  pkgs.nasm
                  pkgs.binutils
                ]
              }"
          done
        '';
      };
    };
}
