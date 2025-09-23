
<div align="center">
    <h1>
        <code> ~/.dotfiles </code>
    </h1>
</div>

## Overview

Hello, future me! This README is supposed to guide you through a fresh environment setup when you inevitably forget how to do half of the stuff here. Note that this guide doesn't include things like installing additional software, like *node* or *cargo*. That's for you to figure out once you're done here (future me might want to add some sort of *"What to install next"* section to the bottom of this README).

For anyone else who isn't future me - also welcome! Feel free to roam around and grab anything that seems interesting to you.

## Table of Contents

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
- [Install and setup Neovim](#install-and-setup-neovim)
    - [Install neovim](#install-neovim)
    - [Install kickstart.nvim](#install-kickstartnvim)
- [Notice](#notice)
- [License](#license)

## Download the repository

Clone this repository to your desired location (I usually go with the home directory):
```sh
$ git clone https://github.com/wedkarz02/.dotfiles.git
```

> [!NOTE]
> Some of the steps ahead might overwrite their respected config files (eg. zsh setup overwriting *.zshrc*), so don't replace them yet. I'll leave it for your intuition to decide when to replace each file.
> 
> At the time of writing this, I prefer to replace files manually. Yes - it is kind of annoying but I find it to be way more reliable than using some ad-hoc bash script (although *future me* might look into using GNU Stow for this).

## Install NerdFont

Download and install FiraMono Nerd Font from [here](https://www.nerdfonts.com/) and set your terminal to use it as a default font.

## Install and setup zsh

### Install zsh

To install zsh, first update the system packages:
```sh
$ sudo apt update
$ sudo apt upgrade -y
```

and install zsh:
```sh
$ apt install zsh
```

Then set zsh as the default shell with ```chsh```:
```sh
$ chsh -s $(which zsh)
```

or in the terminal settings (setting 'custom command' to 'zsh' should do the trick).

After that restart the terminal session and go through the zsh setup prompt.

### Install ohmyzsh

For very quick and easy zsh setup, install ohmyzsh:
```sh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

and the following two plugins for syntax highlighting and autosuggestions:
```sh
$ git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Look through [this list](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) to find more plugins bundled with *Oh My Zsh*.

### Install powerlevel10k

Download the *powerlevel10k* repository:
```sh
$ git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

At this point make sure that the `ZSH_THEME` is set to `powerlevel10k/powerlevel10k` in *.zshrc*.

Restart the terminal session and go through the powerlevel10k setup prompt.

## Install and setup tmux

### Install tmux

Install tmux:
```sh
$ apt install tmux
```

### Install TPM

Install Tmux Plugin Manager:
```sh
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After copying the `.dotfiles/tmux/.tmux.conf` file to your home directory, don't forget to fetch and install TPM plugins with `prefix I`.

## Remap CapsLock to ESC/CTRL

Install and setup [keyd](https://github.com/rvaiya/keyd) daemon. *Quickstart* section has an example of this exact behaviour.

## Install and setup Neovim

### Install neovim

Download neovim tarball (https://github.com/neovim/neovim/releases/) into `~/.local/bin/` and extract it:
```sh
$ tar xzvf nvim-linux-x86_64.tar.gz && rm nvim-linux-x86_64.tar.gz
```

Make a symlink to the executable:
```sh
$ ln -s nvim-linux-x86_64/bin/nvim nvim
```

### Install kickstart.nvim

Install *kickstart.nvim*:
```sh
$ git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

and replace the `~/.config/nvim/init.lua` file with the one from the dotfiles.

## Notice

Thanks to:
- [@novaspirit](https://github.com/novaspirit) - for an easy-to-follow zsh setup guide.
- [@typecraft](https://github.com/typecraft-dev) - for the base of my tmux setup.
- [@tjdevries](https://github.com/tjdevries) - for the great kickstart.nvim.

## License

This repository is licensed under the MIT License. See the [LICENSE](https://github.com/wedkarz02/.dotfiles/blob/main/LICENSE) file for more info.

