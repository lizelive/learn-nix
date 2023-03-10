# overview



https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md

https://nixos.wiki/wiki/Python
out of date?

## poetry2nix
is the most common
## mach-nix - deprecated
had most features, but old code isn't working for some reason
## pypi2nix
Generate Nix expressions for your Python project. Note that sharing derivations from pypi2nix with nixpkgs is possible but not encouraged.

## nixpkgs-pytools
can rewrite inputs which is really cool


nix-shell -p nixpkgs-pytools

`python-package-init safetensors --nixpkgs-root=/home/lizelive/Documents/nixpkgs/`