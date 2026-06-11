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
    # Docker build containers can't unshare user namespaces, so Bubblewrap
    # can't create a rootless sandbox; disable it so source-build formulae
    # (e.g. taps without bottles) can compile during \`brew install\`.
    export HOMEBREW_NO_SANDBOX_LINUX=1

    # Redirect stdin: this script is itself fed to bash via heredoc, so brew
    # would inherit an at-EOF stdin and source-build subprocesses can SIGPIPE.
    brew install ${PACKAGES} </dev/null

    brew cleanup --prune=all -s </dev/null
    rm -rf "\$(brew --cache)"
EOF

rm -rf /var/lib/apt/lists/*

echo "Finished installing Homebrew packages!"
