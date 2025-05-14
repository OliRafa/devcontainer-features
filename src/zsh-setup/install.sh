#!/usr/bin/env bash
set -e


echo "Starting to setup Zsh..."

git clone -b v5 https://github.com/romkatv/zsh4humans.git $_REMOTE_USER_HOME/zsh4humans

cp $_REMOTE_USER_HOME/zsh4humans/.zshenv $_REMOTE_USER_HOME/.zshenv

rm -rf $_REMOTE_USER_HOME/zsh4humans

wget https://gist.githubusercontent.com/OliRafa/f39d29a34f38edf4a9c9a2f6dd092260/raw/.p10k.zsh -O $_REMOTE_USER_HOME/.p10k.zsh

wget https://gist.githubusercontent.com/OliRafa/f39d29a34f38edf4a9c9a2f6dd092260/raw/.zshrc -O $_REMOTE_USER_HOME/.zshrc

chown $_REMOTE_USER $_REMOTE_USER_HOME/.p10k.zsh
chown $_REMOTE_USER $_REMOTE_USER_HOME/.zshenv
chown $_REMOTE_USER $_REMOTE_USER_HOME/.zshrc

echo "Finished setting up Zsh!"
