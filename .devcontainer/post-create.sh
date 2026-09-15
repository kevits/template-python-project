#!/bin/bash
set -e

echo "Install ShellCheck"
scversion="v0.11.0"
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
rm -rf "shellcheck-${scversion}"
shellcheck --version

# add project as safe directory
#git config --global --add safe.directory /workspace

echo "Install Antigen - The plugin manager for Zsh"
curl -sSL git.io/antigen > "$HOME/antigen.zsh"

echo "Set up Zsh"
cp "$WORKSPACE/.devcontainer/.zshrc" "$HOME/.zshrc"
cp "$WORKSPACE/.devcontainer/.p10k.zsh" "$HOME/.p10k.zsh"

# Store custom shell functions and tab-completion scripts in .zfunc for Zsh
echo "Set up uv shell completions"
mkdir -p "$HOME/.zfunc"
uv generate-shell-completion zsh > "$HOME/.zfunc/_uv"
uvx --generate-shell-completion zsh > "$HOME/.zfunc/_uvx"

echo "Install uv dependencies"
uv sync

echo "Upgrading pip"
pip install --upgrade pip
