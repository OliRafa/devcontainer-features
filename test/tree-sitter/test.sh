#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

check "tree-sitter is installed" tree-sitter --version

reportResults
