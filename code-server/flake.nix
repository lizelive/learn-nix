{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    with flake-utils.lib;
      eachSystem [system.x86_64-linux system.aarch64-linux] (
        system: let
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
          };
          vscode-server-launcher = pkgs.requireFile {
            name = "vscode-server-launcher";
            url = "https://aka.ms/vscode-server-launcher/x86_64/unknown-linux-gnu";
            sha256 = "ffffffffffffffffffffffffffffffffffffffffffffffffffff";
          };
          install-vscode-server = pkgs.writeShellApplication {
            name = "install-vscode-server";
            runtimeInputs = [wget sh];
            text = ''
              echo "Installing vscode-server"
              wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
            '';
          };
        in {
          # cudaCapabilities = pkgs.cudaPackages;
          # defaultPackage = pkgs.cudaPackages.cuda-samples;
          defaultPackage = install-vscode-server;
        }
      );
}
