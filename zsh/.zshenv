export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINS="$ZDOTDIR/plugins"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=1000
export SAVEHIST=1000

export EDITOR="nvim"
export VISUAL="nvim"

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# Setup fzf keybindings
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set fzf theme to catppuccin-mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# Set Catppuccin as the default bat theme
export BAT_THEME="Catppuccin Mocha"

