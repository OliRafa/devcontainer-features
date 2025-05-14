#!/usr/bin/env bash
set -e

mkdir -p $_REMOTE_USER_HOME/.local/bin

ln -s /usr/bin/batcat $_REMOTE_USER_HOME/.local/bin/bat

chown $_REMOTE_USER $_REMOTE_USER_HOME/.local
chown $_REMOTE_USER $_REMOTE_USER_HOME/.local/**/*

echo "Finished installing Bat!" 
