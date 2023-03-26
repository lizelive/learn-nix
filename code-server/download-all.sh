#!/bin/sh
# download all versions of vscode-server-launcher
TMP_DIR=$(mktemp -d)
OUT_DIR=${TMP_DIR}/vscode-server-launcher
echo "tmp dir is $TMP_DIR"
mkdir -p $OUT_DIR

command_exists() {
  command -v "$1" > /dev/null 2>&1
}

for arch in aarch64 x86_64; do
  for target in unknown-linux-gnu unknown-linux-musl apple-darwin-signed; do
    url=https://aka.ms/vscode-server-launcher/$arch-$target
    echo "url is $url"
    out_file=$OUT_DIR/$arch-$target
    echo "out file is $out_file"
    if command_exists curl; then
      curl -sSL "$url" -o "$out_file"
    elif command_exists wget; then
      wget -qO "$out_file" "$url"
    else
      echo "Please install curl or wget"
      exit 1
    fi
    done
done