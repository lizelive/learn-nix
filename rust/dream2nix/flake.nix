{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    dream2nix.url = "github:nix-community/dream2nix";
    flake-utils.url = "github:numtide/flake-utils";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inp @ {dream2nix, nixpkgs, flake-utils, ... }:
  # let
  #   nixpkgs = dream2nix.inputs.nixpkgs;
  # in 
  (
    dream2nix.lib.makeFlakeOutputs {
      systemsFromFile = ./nix_systems;
      config.projectRoot = ./.;
      source = ./.;
      projects = ./projects.toml;
    }
    # // flake-utils.lib.eachDefaultSystem (system: {
    #   formatter = nixpkgs.legacyPackages.${system}.alejandra;
    # })
    # // {
    #   # formatter = inp.flake-utils.lib.eachDefaultSystem (system: { formatter = inp.dream2nix.inputs.nixpkgs.legacyPackages.${system}.alejandra});
    #   formatter = {
    #     x86_64-linux = inp.dream2nix.inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    #   };
    # }
  );
}
