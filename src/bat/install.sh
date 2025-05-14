#!/usr/bin/env bash
set -e

mkdir -p $_REMOTE_USER_HOME/.local/bin && ln -s /usr/bin/batcat $_REMOTE_USER_HOME/.local/bin/bat

echo "Finished installing Bat!" 
