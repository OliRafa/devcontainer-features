#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

# `dotfiles` install.sh clones into the home of whichever user the
# devcontainer build resolves as _REMOTE_USER. The test runs inside the
# same container, so $HOME points at that same home directory.
check "dotfiles repo cloned" test -d "${HOME}/dotfiles"
check "dotfiles is a git repo" test -d "${HOME}/dotfiles/.git"

reportResults
