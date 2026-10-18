# Homebrew Tap for Quicksilver

Install [Quicksilver](https://github.com/GOI17/quicksilver), a Neovim configuration with contextual shortcut hints:

```sh
brew tap GOI17/quicksilver
brew install GOI17/quicksilver/quicksilver
quicksilver --version
quicksilver
```

Use the qualified formula name to avoid the unrelated Quicksilver macOS app.
Git, Neovim, and ripgrep are installed as dependencies. Plugins install on the first launch.

```sh
brew upgrade GOI17/quicksilver/quicksilver
brew uninstall GOI17/quicksilver/quicksilver
```

If migrating from the source installation, remove its `quicksilver` shell alias so the Homebrew executable is used.
