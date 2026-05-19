#!/usr/bin/env bash
set -e


echo "Starting to setup Dotfiles..."

USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"
HOME_DIR=$( getent passwd "$USERNAME" | cut -d: -f6 )

echo "Downloading Dotfiles..."
sudo -u $USERNAME bash <<EOF
    cd $HOME_DIR
    git clone https://github.com/OliRafa/dotfiles.git
    cd dotfiles

    # Using --adopt with "git reset --hard" lets us replace files already
    # present in the filesystem with files from the repository. Backticks
    # are avoided here on purpose: the heredoc is unquoted so the outer
    # shell would try to execute their contents as commands.
    stow . --adopt
    git reset --hard
EOF

echo "Finished setting up Dotfiles!"
