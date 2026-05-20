#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

# Binary-providing formulas: invoke them to prove the binary runs.
check "zsh is installed" bash -lc 'zsh --version'
check "delta is installed" bash -lc 'delta --version'
check "eza is installed" bash -lc 'eza --version'
check "bat is installed" bash -lc 'bat --version'
check "starship is installed" bash -lc 'starship --version'
check "zoxide is installed" bash -lc 'zoxide --version'
check "fzf is installed" bash -lc 'fzf --version'
check "ripgrep is installed (rg)" bash -lc 'rg --version'
# zsh plugin formulas ship .zsh source files, no binaries. Verify each
# is installed via brew's receipt.
check "zsh-completions installed" bash -lc 'brew list zsh-completions >/dev/null'
check "zsh-autosuggestions installed" bash -lc 'brew list zsh-autosuggestions >/dev/null'
check "zsh-transient-prompt installed" bash -lc 'brew list zsh-transient-prompt >/dev/null'

reportResults
