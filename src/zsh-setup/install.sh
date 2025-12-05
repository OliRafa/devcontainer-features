#!/usr/bin/env bash
set -e


echo "Starting to setup Zsh..."
USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"

echo "Installing zsh-autosuggestions..."
sudo -u $USERNAME bash <<EOF
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://codeberg.org/olets/zsh-transient-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/zsh-transient-prompt
EOF

echo "Finished setting up Zsh!"
