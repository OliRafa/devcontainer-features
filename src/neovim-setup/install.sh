#!/usr/bin/env bash
set -e


echo "Starting to setup Neovim..."

export GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=accept-new'

USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"
HOME_DIR=$( getent passwd "$USERNAME" | cut -d: -f6 )

if [ ! -d "$HOME_DIR/.config" ]
then
    echo "Creating $HOME_DIR/.config dir..."
    mkdir -p $HOME_DIR/.config
else
    if [ -n "$(ls -A "$HOME_DIR/.config" 2>/dev/null)" ]
    then
        echo "Backing up $HOME_DIR/.config dir..."
        mkdir $HOME_DIR/temp
        mv $HOME_DIR/.config/* $HOME_DIR/temp/
    fi
fi

echo "Downloading DotFiles..."
git clone git@github.com:OliRafa/neovim-configs.git $HOME_DIR/.config

if [ -d "$HOME_DIR/temp" ]
then
    echo "Cleaning up $HOME_DIR/.config dir backup..."
    mv $HOME_DIR/temp/* $HOME_DIR/.config/
    rm -r $HOME_DIR/temp
fi

echo "Setting up LazyVim and Mason..."
nvim --headless "+Lazy! sync" +qa

echo "Finished setting up Neovim!"
