{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  inputs.alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  outputs = inp:
    inp.dream2nix.lib.makeFlakeOutputs {
      systemsFromFile = ./nix_systems;
      config.projectRoot = ./.;
      source = ./.;
      projects = ./projects.toml;
    };
}
