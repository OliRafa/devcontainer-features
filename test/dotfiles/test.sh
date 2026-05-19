#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

USERNAME="${_REMOTE_USER:-vscode}"
HOME_DIR="$(getent passwd "${USERNAME}" | cut -d: -f6)"

check "dotfiles repo cloned" test -d "${HOME_DIR}/dotfiles"
check "dotfiles is a git repo" test -d "${HOME_DIR}/dotfiles/.git"

reportResults
