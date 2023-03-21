{
  description = "nix ml shell";
  inputs = {
    nixpkgs.url = "/home/lizelive/Documents/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    nixgl.url = "github:guibou/nixGL";
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
        python = pkgs.python310.withPackages (p:
          with p; [
            pytorch-bin
            transformers
            diffusers
            accelerate
            scipy
            # safetensors
          ]);
      in {defaultPackage = python;}
    );
}
