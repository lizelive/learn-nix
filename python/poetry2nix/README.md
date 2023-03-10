`
nix-shell -p 'python310.withPackages(ps: with ps; [ poetry ])'
poetry init
poetry source add pytorch-nightly-cu117 https://download.pytorch.org/whl/nightly/cu117
poetry add torch --allow-prereleases --source=pytorch-nightly-cu117
`