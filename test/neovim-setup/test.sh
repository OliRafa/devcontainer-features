#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

# Binary-providing formulas: invoke them to prove the binary runs.
check "neovim is installed" bash -lc 'nvim --version'
check "npm is installed" bash -lc 'npm --version'
check "commitizen is installed (cz)" bash -lc 'cz version'
check "lazygit is installed" bash -lc 'lazygit --version'
check "delta is installed" bash -lc 'delta --version'
# tree-sitter (the formula) only ships libtree-sitter; the `tree-sitter`
# binary comes from tree-sitter-cli. Verify both: the library via brew's
# receipt, and the CLI by invoking the binary.
check "tree-sitter (library) installed" bash -lc 'brew list tree-sitter >/dev/null'
check "tree-sitter-cli binary works" bash -lc 'tree-sitter --version'

reportResults
