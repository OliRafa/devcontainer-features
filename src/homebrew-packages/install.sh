#!/usr/bin/env bash
set -e

echo "Starting to install Homebrew packages..."

USERNAME="${USERNAME:-"${_REMOTE_USER:-"dev"}"}"
BREW_PREFIX="/home/linuxbrew/.linuxbrew"
PACKAGES_RAW="${PACKAGES:-}"
PACKAGES="${PACKAGES_RAW//,/ }"

if [ -z "${PACKAGES// /}" ]; then
    echo "No packages specified (option \`packages\` is empty); nothing to install."
    exit 0
fi

echo "Installing Homebrew packages [${PACKAGES}] as '${USERNAME}'..."
sudo -u "${USERNAME}" bash <<EOF
    set -e
    eval "\$(${BREW_PREFIX}/bin/brew shellenv)"
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_ENV_HINTS=1
    export HOMEBREW_NO_INSTALL_CLEANUP=1

    brew install ${PACKAGES}

    brew cleanup --prune=all -s
    rm -rf "\$(brew --cache)"
EOF

rm -rf /var/lib/apt/lists/*

echo "Finished installing Homebrew packages!"
