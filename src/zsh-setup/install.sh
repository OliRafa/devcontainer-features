#!/usr/bin/env bash
set -e

# zsh-setup has no setup steps of its own: the package installs are handled
# by the homebrew-packages dependency, and the rc files come from dotfiles.
# This file exists because `devcontainer features publish` requires every
# feature to ship an install.sh.

echo "Zsh setup complete (packages installed via the homebrew-packages dependency)."
