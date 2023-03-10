{
  description = "nix ml shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }: let
    cool = flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            cudaSupport = true;
          };
        };
      in {
        devShell = builtins.trace "shell" pkgs.mkShell {
          buildInputs = with pkgs; [
            hello
          ];
        };
        formatter.${system} = builtins.trace "help" pkgs.alejandra;
      }
    );
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}
