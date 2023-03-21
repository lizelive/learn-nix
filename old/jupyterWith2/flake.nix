{
  description = "Your jupyterWith project";

  inputs.nixpkgs.follows = "jupyterWith/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.jupyterWith.url = "github:tweag/jupyterWith/main";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    jupyterWith,
  }:
  # TODO - Update Linux first and then MacOS when it is working.
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        inherit (jupyterWith.lib.${system}) mkJupyterEnvFromKernelPath;

        pkgs = import nixpkgs {inherit system;};
        jupyterEnvironment = mkJupyterEnvFromKernelPath pkgs ./kernels;
      in rec {
        packages = {inherit jupyterEnvironment;};
        packages.default = jupyterEnvironment;
        apps.default.program = "${jupyterEnvironment}/bin/jupyter-lab";
        apps.default.type = "app";
      }
    );
}
