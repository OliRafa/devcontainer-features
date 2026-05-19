#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

check "brew is available" bash -lc 'brew --version'
check "tree is installed via brew" bash -lc 'tree --version'

reportResults
