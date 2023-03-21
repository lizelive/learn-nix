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
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            cudaSupport = true;
            cudaCapabilities = ["8.6"];
            cudaVersion = "12.0";
          };
        };
        hello = pkgs.writeShellScriptBin "hello" "echo Hello, world!";
      in {
        shellScripts = {inherit hello;};
        # cudaCapabilities = pkgs.cudaPackages;
        # defaultPackage = pkgs.cudaPackages.cuda-samples;
        defaultPackage = hello;
      }
    );
}
