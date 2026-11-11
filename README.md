# Homebrew Tap

Install the tap:

```sh
brew tap shmileee/tap
```

## Alacritty

Install Alacritty from its official, unsigned macOS release:

```sh
brew install --cask shmileee/tap/alacritty
```

The cask removes the quarantine attribute after installation.

## Notch Assistant

A Dynamic-Island-style panel for the MacBook notch, with FireHydrant on-call and incidents
([shmileee/notch-assistant](https://github.com/shmileee/notch-assistant)). Apple silicon, macOS 13 or later.

```sh
brew install --cask shmileee/tap/notch-assistant
```

The app is ad-hoc signed, so the cask removes the quarantine attribute after installation. Turn on
"Open at login" in its Settings. `brew uninstall --zap` also removes the login item and its settings.

## Updates

Renovate tracks each app's GitHub releases and proposes version and SHA-256 updates together.
