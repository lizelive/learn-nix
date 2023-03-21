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
        my-python = pkgs.python310;
        my-python-with-packages = my-python.withPackages (p: with p; [
          pytorch-bin
        ]);
      in { defaultPackage = my-python-with-packages; }
    );
}
