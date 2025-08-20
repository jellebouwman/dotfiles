# Dotfiles

# Arch manual ----------

## PNPM

Following [the installation guide](https://pnpm.io/installation#on-posix-systems) to install PNPM on a POSIX system.
The config to make it available in zsh is in `.zshrc`.

## FNM

Experimenting with fnm over nvm - install can be done through [the script provided on GitHub](https://pnpm.io/installation#on-posix-systems).

## Extra packages installed through yay

I use Omarchy as a base. There are some packages I have installed with `yay -S <package-name>`.
These are `firefox-developer-edition` and `slack`.

```zsh
yay -S firefox-developer-edition slack
```

I have also removed some packages that I do not need. These are `spotify` and `zoom`.

```zsh
yay -R spotify zoom
```
