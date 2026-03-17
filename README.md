# macOS Dotfiles

Omarchy-inspired window management setup for macOS.

## Prerequisites

- [Homebrew](https://brew.sh)
- [Raycast](https://raycast.com) (app launcher)

## Installation

### 1. Install Aerospace (tiling window manager)

```bash
brew install --cask nikitabobko/tap/aerospace
```

Grant **Accessibility permissions**: System Settings > Privacy & Security > Accessibility > Enable AeroSpace

### 2. Symlink config

```bash
ln -sf ~/dev/dotfiles/macos/aerospace.toml ~/.aerospace.toml
```

### 3. Start Aerospace

```bash
open -a AeroSpace
```

## Keybinding Reference

| Key | Action |
|-----|--------|
| `opt + h/j/k/l` | Focus window left/down/up/right |
| `opt + shift + h/j/k/l` | Move window |
| `opt + 1-5` | Switch workspace |
| `opt + shift + 1-5` | Move window to workspace |
| `opt + tab` | Toggle last workspace |
| `opt + backtick` | Toggle last focused window |
| `opt + f` | Fullscreen |
| `opt + t` | Toggle float/tile |
| `opt + slash` | Toggle horizontal/vertical split |
| `opt + a` | Toggle accordion layout |
| `opt + b` | Balance window sizes |
| `opt + g` | Join with window below |
| `opt + shift + g` | Join with window to right |
| `opt + w` | Close window |
| `opt + shift + w` | Close all but current |
| `opt + r` | Enter resize mode |
| `opt + shift + r` | Reload config |
| `opt + ctrl + h/j/k/l` | Focus monitor |
| `opt + shift + ctrl + h/j/k/l` | Move window to monitor |

**Resize mode:** `h/j/k/l` to resize, `esc` or `enter` to exit

## Floating Apps

These apps float by default:
- System Settings
- Raycast
- 1Password

## Tips

- **Create split layouts:** Use `opt + g` (join below) or `opt + shift + g` (join right) to nest windows
- **Example:** For 1 window left, 2 stacked right: focus middle window, press `opt + g` to join with the one below
