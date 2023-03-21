{
  inputs.dream2nix.url = "github:nix-community/dream2nix";

  outputs = inp: (
    inp.dream2nix.lib.makeFlakeOutputs {
      systemsFromFile = ./nix_systems;
      config.projectRoot = ./.;
      source = ./.;
      projects = ./projects.toml;
    }
    // {
      formatter.x86_64-linux = inp.dream2nix.inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    }
  );
}
