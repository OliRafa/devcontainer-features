#!/usr/bin/env bash
set -e


echo "Starting to setup Neovim..."

USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"
BREW_PREFIX="/home/linuxbrew/.linuxbrew"

echo "Setting up LazyVim and Mason..."
sudo -u "${USERNAME}" bash <<EOF
    set -e
    eval "\$(${BREW_PREFIX}/bin/brew shellenv)"
    nvim --headless "+Lazy! sync" +qa
EOF

echo "Finished setting up Neovim!"
