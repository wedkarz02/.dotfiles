
<div align="center">
    <h1>
        <code> ~/.dotfiles </code>
    </h1>
</div>

## Overview

Hello, future me! This README is supposed to guide you through a fresh environment setup when you inevitably forget how to do half of the stuff here. Note that this guide doesn't include things like installing additional software, like *node* or *cargo*. That's for you to figure out once you're done here (future me might want to add some sort of *"What to install next"* section to the bottom of this README).

For anyone else who isn't future me - also welcome! Feel free to roam around and grab anything that seems interesting to you.

![Screenshot of my CLI setup](https://i.imgur.com/4h8cpch.png)

## Table of Contents

- [Requirements](#requirements)
- [Download the repository](#download-the-repository)
- [Install NerdFont](#install-nerdfont)
- [Install and setup zsh](#install-and-setup-zsh)
    - [Install zsh](#install-zsh)
    - [Install ohmyzsh](#install-ohmyzsh)
    - [Install powerlevel10k](#install-powerlevel10k)
- [Install and setup tmux](#install-and-setup-tmux)
    - [Install tmux](#install-tmux)
    - [Install tpm](#install-tpm)
- [Remap CapsLock to ESC/CTRL](#remap-capslock-to-escctrl)
- [Install Neovim](#install-neovim)
- [Setting up `bat` theme](#setting-up-bat-theme)
- [GNU Stow](#gnu-stow)
- [Notice](#notice)
- [License](#license)

## Requirements

Software to install before proceeding (*install-all* script WIP):

| Package | Install Command |
|---------|-----------------|
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

> [!IMPORTANT]
> Some of these technically are not necessary but they **ARE** referenced in different places in the configs.
> Sourcing `.zshrc` might error out if there are not installed.

## Download the repository

Clone this repository to your desired location (I usually go with the home directory):
```sh
git clone https://github.com/wedkarz02/.dotfiles.git
```

> [!NOTE]
> This doc is somewhat messy and assumes a fresh system setup. Most steps are not really required but I find it least confusing to follow them, move the config files to .bak, and just let GNU Stow do it's thing in the end. It's not ideal but it's good enough and gets the job done.

## Install NerdFont

> [!NOTE]
> This step is not required for ghostty terminal emulator as ghostty comes bundled with Nerd Fonts.

Download and install FiraMono Nerd Font from [here](https://www.nerdfonts.com/) and set your terminal to use it as a default font.

## Install and setup zsh

### Install zsh

To install zsh, first update the system packages:
```sh
sudo dnf update
```

and install zsh:
```sh
sudo dnf install zsh
```

Then set zsh as the default shell with ```chsh```:
```sh
chsh -s $(which zsh)
```

or in the terminal settings (setting 'custom command' to 'zsh' should do the trick).

After that restart the terminal session and go through the zsh setup prompt.

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

### Install powerlevel10k

Download the *powerlevel10k* repository:
```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

At this point make sure that the `ZSH_THEME` is set to `powerlevel10k/powerlevel10k` in *.zshrc*.

Restart the terminal session and go through the powerlevel10k setup prompt (I didn't include powerlevel10k config in this repository but it's very quick to setup).

## Install and setup tmux

### Install tmux

```sh
sudo dnf install tmux
```

### Install TPM

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After linking with GNU Stow, don't forget to fetch and install TPM plugins with `prefix I`.

## Remap CapsLock to ESC/CTRL

Install and setup [keyd](https://github.com/rvaiya/keyd) daemon. *Quickstart* section has an example of this exact behaviour. For more convenient usage set a system-wide keyboard shortcut to the *toggle_keyd.sh* script.

## Install Neovim

Download neovim tarball (https://github.com/neovim/neovim/releases/) into `~/.local/bin/` and extract it:
```sh
tar xzvf nvim-linux-x86_64.tar.gz && rm nvim-linux-x86_64.tar.gz
```

Make a symlink to the executable:
```sh
ln -s nvim-linux-x86_64/bin/nvim nvim
```

## Setting up `bat` theme

Create a `bat` config directory:
```sh
mkdir -p "$(bat --config-dir)/themes"
```

Download the TokyoNight theme:
```sh
cd "$(bat --config-dir)/themes" && wget https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/sublime/tokyonight_night.tmTheme
```

Rebuild `bat` cache:
```sh
bat cache --build
```

## GNU Stow

*GNU Stow* makes managing symlinks very easy. First, install `stow`:

```sh
sudo dnf install stow
```

> [!Important]
> Make sure to backup old configs with `mv .original .original.bak`. That way they won't get replaced with symlinks to files in the `.dotfiles/` directory:

```
.dotfiles/
├── bin/
│   └── .local/
│       └── bin/
│           └── fn/
├── ghostty/
│   └── .config/
│       └── ghostty/
├── git/
│   └── .gitconfig
├── kitty/
│   └── .config/
│       └── kitty/
├── nvim/
│   └── .config/
│       └── nvim/
├── tmux/
│   └── .tmux.conf
└── zsh/
    ├── .zsh_aliases
    └── .zshrc
```

Now use `stow` to make symlinks for a specific package you want to install, eg.:
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

which will remove all symlinks. After that you can re-enable your backed up configs (you did back them up right? RIGHT?).

> [!NOTE]
> At the time of writing this I'm using ghostty terminal emulator but it's still somewhat new so I'm going to leave kitty config for now. If you don't need it, unstow it with:

```sh
stow -D kitty/
```

## Notice

Thanks to:
- [kickstart.nvim contributors](https://github.com/nvim-lua/kickstart.nvim/graphs/contributors) - for the great kickstart.nvim config.
- [@dam9000](https://github.com/dam9000) - for an inspiration on modularizing kickstart.
- [@novaspirit](https://github.com/novaspirit) - for an easy-to-follow zsh setup guide.
- [@typecraft](https://github.com/typecraft-dev) - for the base of my tmux setup.

## License

This repository is licensed under the MIT License. See the [LICENSE](https://github.com/wedkarz02/.dotfiles/blob/main/LICENSE) file for more info.

