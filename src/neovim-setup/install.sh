#!/usr/bin/env bash
set -e


echo "Starting to setup Neovim..."

echo "Downloading Dotfiles..."
git clone https://github.com/OliRafa/dotfiles.git 
cd dotfiles
stow .

echo "Setting up LazyVim and Mason..."
nvim --headless "+Lazy! sync" +qa


echo "Finished setting up Neovim!"
