https://github.com/cargo2nix/cargo2nix


```
# Use nix to get cargo2nix & rust toolchain on your path
nix develop github:cargo2nix/cargo2nix#bootstrap

# In directory with Cargo.toml & Cargo.lock files (cargo generate-lockfile)
cargo2nix

# Or skip the shell and run it directly
nix run github:cargo2nix/cargo2nix

# You'll need this in version control
git add Cargo.nix
```