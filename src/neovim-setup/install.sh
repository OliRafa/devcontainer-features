#!/usr/bin/env bash
set -e


echo "Starting to setup Neovim..."

USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"

echo "Downloading Dotfiles..."
sudo -u $USERNAME bash <<EOF
    echo "Setting up LazyVim and Mason..."
    nvim --headless "+Lazy! sync" +qa
EOF

echo "Finished setting up Neovim!"
