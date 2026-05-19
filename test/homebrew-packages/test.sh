#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

# Default scenario: feature installed with the `packages` option empty,
# so no packages are installed. We only assert that the underlying
# Homebrew install (from the meaningful-ooo/homebrew dependency) is
# present. The install_tree scenario covers the actual brew install path.
check "brew is available" bash -lc 'brew --version'

reportResults
