mcr.microsoft.com/devcontainers/base:ubuntu


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
        baseImage = pullImage {
          imageName = "mcr.microsoft.com/devcontainers/base";
          imageDigest = "sha256:68bf82c57005e705d17736c208b321a9ecf9a0a9977b0afa380395a770aaabb8";
          sha256 = "1h569rlgxiq4dryr3bpqz853y6nj8pkz1bmycxi5hf1qi0hbsfkl";
          finalImageName = "mcr.microsoft.com/devcontainers/base";
          finalImageTag = "ubuntu";
        };
        my-python = pkgs.python310;
        my-python-with-packages = my-python.withPackages (p: with p; [
          pytorch-bin
        ]);
      in { defaultPackage = my-python-with-packages; }
    );
}
