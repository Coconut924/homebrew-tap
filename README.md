# Coconut924 Homebrew tap

Homebrew formulas for tools maintained by [Coconut924](https://github.com/Coconut924).

## Install

```sh
brew tap Coconut924/tap
brew install Coconut924/tap/workspace
```

`workspace` creates native iTerm2 windows and pane layouts from YAML. It bundles
Python and its runtime dependencies, so no Python installation or source checkout
is required. It requires macOS and iTerm2 with **Settings → General → Magic →
Enable Python API** enabled. Approve its connection prompt on first launch.

```sh
workspace init
workspace .
```

See the [workspace documentation](https://github.com/Coconut924/workspace#readme)
for configuration options, presets, pane settings, and tab colors.

## Update or uninstall

```sh
brew update
brew upgrade Coconut924/tap/workspace
brew uninstall workspace
```

## Maintaining formulas

Each tool has its own Ruby file under `Formula/`. Additional tools can be added
without changing existing formulas.

The workspace formula downloads architecture-specific standalone executables
from [GitHub Releases](https://github.com/Coconut924/workspace/releases) and
verifies SHA-256 checksums. To package and publish a new workspace version,
follow [Packaging and Homebrew releases](https://github.com/Coconut924/workspace/blob/main/docs/releases.md).
The source repository's `mise run publish-tap` command verifies the published
assets, updates only `Formula/workspace.rb`, and pushes that change here.

GitHub Actions installs the published workspace formula and runs `brew test`
on Apple Silicon and Intel macOS runners after formula updates.
