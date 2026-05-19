#!/usr/bin/env bash
set -e

source dev-container-features-test-lib

check "bat is installed" bat --version

reportResults
