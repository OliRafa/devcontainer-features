#!/usr/bin/env bash
set -e


echo "Starting to setup Neovim..."

USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"
HOME_DIR=$( getent passwd "$USERNAME" | cut -d: -f6 )

echo "Downloading Dotfiles..."
cd $HOME_DIR
git clone https://github.com/OliRafa/dotfiles.git 
cd dotfiles

# By using the combo `--adopt` with `git reset --hard` we can replace files that
# are already in the filesystem with files from the repository.
runuser -l $USERNAME -- stow . --adopt
git reset --hard

echo "Setting up LazyVim and Mason..."
nvim --headless "+Lazy! sync" +qa

echo "Finished setting up Neovim!"
