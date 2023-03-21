{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            cudaSupport = true;
            cudaCapabilities = [ "8.6" ];
            cudaVersion = "12.0";
          };
          overlays = [ self.overlay ];
        };
      in
      {
        overlay = final: prev: {
          hello = pkgs.writeText "hello" "Hello, world!";
        };
        # cudaPackages.cuda-samples
        defaultPackage = pkgs.hello;
      }
    );
}
