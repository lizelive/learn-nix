{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.parts.url = "github:hercules-ci/flake-parts";
  inputs.parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  outputs = inputs:
    inputs.parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.dream2nix.flakeModuleBeta
      ];
      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
        # ...
      ];
      perSystem = { config, system, lib, pkgs, ... }: {
        # Auto formatters. This also adds a flake check to ensure that the
        # source tree was auto formatted.
        treefmt.config = {
          projectRootFile = "flake.nix";
          programs.nixpkgs-fmt.enable = true;
        };
      };
    };

  # outputs = inp: (
  #   inp.dream2nix.lib.makeFlakeOutputs {
  #     systemsFromFile = ./nix_systems;
  #     config.projectRoot = ./.;
  #     source = ./.;
  #     projects = ./projects.toml;
  #   }
  #   // {
  #     formatter.x86_64-linux = inp.dream2nix.inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
  #   }
  # );
}
