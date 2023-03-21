https://github.com/nix-community/dream2nix

should automatically generate a nix expression for a rust project



```
nix flake init -t github:nix-community/dream2nix#simple
nix eval --impure --raw --expr 'builtins.currentSystem' > ./nix_systems && git add ./nix_systems
nix run github:nix-community/dream2nix#detect-projects . > ./projects.toml && git add ./projects.toml
nix flake show
```
