#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

check "zsh is installed" bash -lc 'zsh --version'
check "eza is installed" bash -lc 'eza --version'
check "bat is installed" bash -lc 'bat --version'
check "starship is installed" bash -lc 'starship --version'
check "zoxide is installed" bash -lc 'zoxide --version'
check "fzf is installed" bash -lc 'fzf --version'
check "ripgrep is installed" bash -lc 'rg --version'

reportResults
