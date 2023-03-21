```
nix-shell -p 'python310.withPackages(ps: with ps; [ poetry ])'
poetry init
poetry add torch
```

`poetry2nix` is a tool that turns Poetry projects into Nix derivations without the need to actually write Nix expressions. It does so by parsing `pyproject.toml` and `poetry.lock` and converting them to Nix derivations on the fly. For more information, see the announcement post on the Tweag blog

https://github.com/nix-community/poetry2nix
https://www.tweag.io/blog/2020-08-12-poetry2nix