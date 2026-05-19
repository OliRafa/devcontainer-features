#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

check "neovim is installed" bash -lc 'nvim --version'
check "npm is installed" bash -lc 'npm --version'
check "commitizen is installed" bash -lc 'cz version'
check "lazygit is installed" bash -lc 'lazygit --version'
check "delta is installed" bash -lc 'delta --version'
check "tree-sitter is installed" bash -lc 'tree-sitter --version'

reportResults
