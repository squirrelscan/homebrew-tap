# squirrelscan Homebrew tap

```sh
brew install --cask squirrelscan/tap/squirrel
```

Homebrew is an entry point, not the owner. The cask installs a small shim. The
first time you run `squirrel` the shim runs the regular squirrelscan installer
(the same one as `curl -fsSL https://install.squirrelscan.com/install.sh | bash`),
which puts the CLI in `~/.squirrel/releases` and a symlink in `~/.local/bin`.
After that the CLI updates itself with `squirrel self update`, and `brew upgrade`
has nothing to do.

`~/.local/bin` must be on your `PATH`, as with the curl installer.

## Uninstall

```sh
brew uninstall --cask squirrel          # removes the shim and the managed install
brew uninstall --zap --cask squirrel    # also removes ~/.squirrel (settings, credentials)
```

## Docs

https://docs.squirrelscan.com
