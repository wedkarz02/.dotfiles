# NOTE: Plugins live in $ZPLUGINS (most likely ~/.config/zsh/plugins).
#       Remember to clone plugin repos to $ZPLUGINS before sourcing '.zshrc'.
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

for plugin in "${plugins[@]}"; do
  source "$ZPLUGINS/$plugin/$plugin.zsh"
done

# Load custom zsh aliases from ~/.zshaliases
source "$ZDOTDIR/.zshaliases"

# Setup cargo
source "$HOME/.cargo/env"

# Setup nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup fzf keybindings and fuzzy completion
source <(fzf --zsh)

# Setup fzf-git
source "$HOME/.local/bin/fzf-git.sh"

# Init starship prompt
eval "$(starship init zsh)"

