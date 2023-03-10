{
  description = "JupyterLab Flake";

  inputs = {
      mach-nix.url = "mach-nix/3.5.0";
      jupyterWith.url = "github:tweag/jupyterWith";
      flake-utils.url = "github:numtide/flake-utils";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs, jupyterWith, flake-utils, mach-nix }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" ] (system:
      let
      defaultPackages = pkgs: mach-nix.lib."${system}".mkPython {
	requirements = ''
	  pillow
	  numpy
	  torch
	'';
      };
        pkgs = import nixpkgs {
          system = system;
          overlays = nixpkgs.lib.attrValues jupyterWith.overlays;
        };
        iPython = pkgs.kernels.iPythonWith {
          name = "Python-env";
          packages = p: with p; [ sympy numpy pytorch ];
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
        packages.default = defaultPackages;
        devShell = jupyterEnvironment.env;
      }
    );
}
