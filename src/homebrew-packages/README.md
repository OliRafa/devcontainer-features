
# Homebrew Packages (homebrew-packages)

Installs Homebrew packages using Homebrew (Linuxbrew). ARM64-compatible; mirrors the `package` option of ghcr.io/devcontainers-extra/features/homebrew-package without using nanolayer.

## Example Usage

```json
"features": {
    "ghcr.io/OliRafa/devcontainer-features/homebrew-packages:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| packages | Comma-separated list of Homebrew packages to install (e.g. "eza,bat,zsh"). Whitespace around commas is ignored. Taps are supported in the usual `tap/name` form. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/OliRafa/devcontainer-features/blob/main/src/homebrew-packages/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
