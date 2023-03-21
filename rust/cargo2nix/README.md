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


`cargo2nix` is a utility that reads the Rust workspace configuration and `Cargo.lock` and generates nix expressions that encode some of the feature, platform, and target logic into a `Cargo.nix`¹. The `cargo2nix` Nixpkgs overlay consumes the `Cargo.nix`, feeding it what you pass to `makePackageSet` to provide workspace outputs you can expose in your nix flake¹. 

It brings Nix dependency management to your Rust project and provides a development shell. Knowing all the dependencies means easy creation of complete shells. Run `nix develop` or `direnv allow` in this repo and see!¹³

You can find the latest releases of `cargo2nix` on their [GitHub page](https://github.com/cargo2nix/cargo2nix/releases)².

(1) GitHub - cargo2nix/cargo2nix: Granular caching, development shell, Nix .... https://github.com/cargo2nix/cargo2nix Accessed 3/20/2023.
(2) Building Nix flakes from Rust workspaces - Tweag. https://www.tweag.io/blog/2022-09-22-rust-nix/ Accessed 3/20/2023.
(3) Releases · cargo2nix/cargo2nix · GitHub. https://github.com/cargo2nix/cargo2nix/releases Accessed 3/20/2023.