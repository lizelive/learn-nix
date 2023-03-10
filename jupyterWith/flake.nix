{
  description = "JupyterLab Flake";

  inputs = {
      jupyterWith.url = "github:tweag/jupyterWith";
      flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, jupyterWith, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = nixpkgs.lib.attrValues jupyterWith.overlays;
        };
        iPython = pkgs.kernels.iPythonWith {
          name = "Python-env";
          packages = p: with p; [ sympy numpy ];
          ignoreCollisions = true;
        };
        jupyterEnvironment = pkgs.jupyterlabWith {
          kernels = [ iPython ];
        };
      in rec {
        apps.jupyterlab = {
          type = "app";
          program = "${jupyterEnvironment}/bin/jupyter-lab";
        };
        apps.default = apps.jupyterlab;
        devShell = jupyterEnvironment.env;
      }
    );
}