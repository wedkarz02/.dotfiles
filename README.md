
<div align="center">
    <h1>
        <code> ~/.dotfiles </code>
    </h1>
</div>

## Overview

Hello, future me! This README is supposed to guide you through a fresh environment setup when you inevitably forget how to do half of the stuff here. For your convenience - the `setup.sh` script will automate installing and setting everything up. If, for some reason, you don't feel comfortable running some random bash hackjob script - take a look at [MANUAL_SETUP.md](https://codeberg.org/wedkarz02/.dotfiles/src/branch/main/MANUAL_SETUP.md). It will guide you through a manual setup (which is almost exactly the same as what `setup.sh` is doing).

> [!NOTE]
> This dotfiles repository targets Fedora Linux specifically, as that is my distro of choice. Other distros will require some adjusting.

For anyone else who isn't future me - also welcome! Feel free to roam around and grab anything that seems interesting to you.

## Table of Contents

- [Requirements](#requirements)
- [Download the repository](#download-the-repository)
- [Setup](#setup)
    - [`setup.sh`](#setupsh)
    - [Manual setup](#manual-setup)
- [File tree](#file-tree)
- [Notice](#notice)
- [License](#license)

## Requirements
- Git
- Some common sense - backup previous configs!

## Download the repository

Clone this repository to your home directory:
```sh
git clone https://codeberg.org/wedkarz02/.dotfiles.git $HOME/.dotfiles
```

## Setup

You have two options - install and configure everything manually or run the script to do it for you.

### `setup.sh`

> [!LLM DISCLOSURE]
> Since I don't particularly enjoy working with bash I decided to do some LLM-assisted coding to get it over with quicker. Keep that in mind, eventhough I did review everything personally - no *AI going loose* shenanigans around here.

Just run the script (it will prompt for confirmation and sudo privileges). Full usage print:
```
Usage: ./setup.sh [--force] [--only STEP...]

Options:
  --force         Skip the confirmation prompt
  --only STEP...  Run only specific steps

Available steps:
  packages   - Install all packages (dnf, rust, nvm, etc.)
  zsh        - Set ZSH as default shell
  omz        - Install Oh My Zsh and plugins
  starship   - Install Starship prompt
  tmux       - Setup Tmux with TPM and Catppuccin theme
  keyd       - Configure keyd key remapper
  bat        - Install Catppuccin theme for bat
  fzf-git    - Setup fzf-git.sh
  btop       - Install Catppuccin theme for btop
  stow       - Stow dotfiles

Examples:
  ./setup.sh                        # Run full setup
  ./setup.sh --force                # Run full setup without confirmation
  ./setup.sh --only tmux            # Only setup tmux
  ./setup.sh --only omz starship    # Only setup Oh My Zsh and Starship
```

### Manual setup

Take a look at the [MANUAL_SETUP.md](https://codeberg.org/wedkarz02/.dotfiles/src/branch/main/MANUAL_SETUP.md) doc for detailed instructions.

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
├── nvim-lazy
│   └── .config
│       └── nvim-lazy
├── starship
│   └── .config
│       └── starship.toml
├── tmux
│   └── .config
│       └── tmux
└── zsh
    ├── .zsh_aliases
    └── .zshrc
```

## Notice

Thanks to:
- [kickstart.nvim contributors](https://github.com/nvim-lua/kickstart.nvim/graphs/contributors) - for the great kickstart.nvim config.
- [@dam9000](https://github.com/dam9000) - for an inspiration on modularizing kickstart.
- [@novaspirit](https://github.com/novaspirit) - for an easy-to-follow zsh setup guide.
- [@Sin-cy](https://github.com/Sin-cy) - for an inspiration on Neovim0.12+ config.

## License

This repository is licensed under the MIT License. See the [LICENSE](https://codeberg.org/wedkarz02/.dotfiles/src/branch/main/LICENSE) file for more info.

