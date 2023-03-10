{
  description = "nix ml shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    mach-nix.url = "mach-nix/3.5.0";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    mach-nix,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            cudaSupport = true;
          };
        };
      in {
        defaultPackage = mach-nix.lib.${system}.mkPython
        {
          requirements = ''
            torch
          '';
        };
        formatter = builtins.trace "help" pkgs.alejandra;
      }
    );
}
