```
nix-shell -p 'python310.withPackages(ps: with ps; [ poetry ])'
poetry init
poetry add torch
```