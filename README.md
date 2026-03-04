
<div align="center">
    <h1>
        <code> ~/.dotfiles </code>
    </h1>
</div>

## Overview

Hello, future me! This README is supposed to guide you through a fresh environment setup when you inevitably forget how to do half of the stuff here. Please note that the current setup still requires manually installing / downloading a bunch of stuff. An `install-all` script is a WIP at the time of writing this but I might scrap the idea in favor of simplicity.

For anyone else who isn't future me - also welcome! Feel free to roam around and grab anything that seems interesting to you.

## Table of Contents

- [Requirements](#requirements)
- [Download the repository](#download-the-repository)
- [Setup zsh](#setup-zsh)
    - [Install ohmyzsh](#install-ohmyzsh)
    - [Install starship](#install-starship)
- [Setup tmux](#setup-tmux)
    - [Install tpm](#install-tpm)
    - [Theme](#theme)
- [Remap CapsLock to ESC/CTRL](#remap-capslock-to-escctrl)
- [Setup bat](#setup-bat)
- [Setup fzf-git](#setup-fzf-git)
- [Setup btop](#setup-btop)
- [GNU Stow](#gnu-stow)
- [File tree](#file-tree)
- [Notice](#notice)
- [License](#license)

## Requirements

Software to install before proceeding:

| Package | Install Command |
|---------|-----------------|
| development-tools | `sudo dnf group install development-tools` |
| gcc | `sudo dnf install gcc` |
| rust-tools | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` |
| nvm | `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh \| bash` |
| just| `cargo install just` |
| ghostty | `sudo dnf copr enable scottames/ghostty && sudo dnf install ghostty` |
| zsh | `sudo dnf install zsh` |
| stow | `sudo dnf install stow` |
| tmux | `sudo dnf install tmux` |
| nvim | `sudo dnf install neovim` |
| keyd | `sudo dnf copr enable alternateved/keyd && sudo dnf install keyd` |
| fd | `sudo dnf install fd-find` |
| rg | `sudo dnf install ripgrep` |
| fzf | `sudo dnf install fzf` |
| bat | `sudo dnf install bat` |
| delta | `sudo dnf install git-delta` |
| btop | `sudo dnf install btop` |
| cloc | `sudo dnf install cloc` |
| tldr | `cargo install tlrc --locked` |

> [!IMPORTANT]
> Some of these technically are not necessary but they *might* be referenced in different places in the configs.
> If not installed - expect a bunch of errors, warnings and stuff exploding.

## Download the repository

Clone this repository to your desired location (I usually go with the home directory):
```sh
git clone https://github.com/wedkarz02/.dotfiles.git
```

## Setup zsh

Set the default shell:
```sh
chsh -s $(which zsh)
```
Follow [this link](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) if there are any issues.

### Install ohmyzsh

For very quick and easy zsh setup, install ohmyzsh:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

and the following two plugins for syntax highlighting and autosuggestions:
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Look through [this list](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) to find more plugins bundled with *Oh My Zsh*.

### Install starship

Install the starship prompt:
```sh
curl -sS https://starship.rs/install.sh | sh
```

## Setup tmux

### Install TPM

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After linking with GNU Stow, don't forget to fetch and install TPM plugins with `prefix I`.

### Theme

Download Catppuccin theme for tmux:
```sh
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

## Remap CapsLock to ESC/CTRL

Copy this config to `/etc/keyd/default.conf` and enable keyd with `sudo systemctl enable keyd --now`:
```
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
esc = capslock
```

## Setup bat

Create a `bat` config directory:
```sh
mkdir -p "$(bat --config-dir)/themes"
```

Download the Catppuccin theme to that directory:
```sh
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
```

Rebuild bat's cache:
```sh
bat cache --build
```

## Setup fzf-git

Make sure that `~/.local/bin` exists:
```sh
mkdir -p ~/.local/bin
```

Download the `fzf-git.sh` script:
```sh
wget -P "$HOME/.local/bin" https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
```

## Setup btop

Download [latest release](https://github.com/catppuccin/btop/releases/download/1.0.0/themes.tar.gz) of Catppuccin for btop:
```sh
mkdir -p ~/.config/btop/themes
wget -P "$HOME/.config/btop" https://github.com/catppuccin/btop/releases/download/1.0.0/themes.tar.gz
tar xf themes.tar.gz
rm themes.tar.gz
```
Set the theme in `btop` manually after that.

## GNU Stow

*GNU Stow* makes managing symlinks very easy.

Use `stow` to make symlinks for a specific package you want to install, eg.:
```sh
stow zsh
```

Or install all of them:
```sh
stow */
```

If, for whatever reason, you need to 'unstow' do:
```sh
stow -D */
```

## File tree

```
.dotfiles
├── bin
│   └── .local
│       └── bin
│           └── fn
├── ghostty
│   └── .config
│       └── ghostty
├── git
│   └── .gitconfig
├── nvim
│   └── .config
│       └── nvim
├── starship
│   └── .config
│       └── starship.toml
├── tmux
│   └── .tmux.conf
└── zsh
    ├── .zsh_aliases
    └── .zshrc
```

## Notice

Thanks to:
- [kickstart.nvim contributors](https://github.com/nvim-lua/kickstart.nvim/graphs/contributors) - for the great kickstart.nvim config.
- [@dam9000](https://github.com/dam9000) - for an inspiration on modularizing kickstart.
- [@novaspirit](https://github.com/novaspirit) - for an easy-to-follow zsh setup guide.

## License

This repository is licensed under the MIT License. See the [LICENSE](https://github.com/wedkarz02/.dotfiles/blob/main/LICENSE) file for more info.

