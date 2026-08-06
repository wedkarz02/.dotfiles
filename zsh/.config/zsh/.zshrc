# NOTE: Plugins live in $ZPLUGINS (most likely ~/.config/zsh/plugins).
#       Remember to clone plugin repos to $ZPLUGINS before sourcing '.zshrc'.
#       zsh-completions doesn't need to be here - it's setup is in '.zshcompletions'.
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

for plugin in "${plugins[@]}"; do
  source "$ZPLUGINS/$plugin/$plugin.zsh"
done; unset -v plugin plugins

# Load zsh completions
source "$ZDOTDIR/.zshcompletions"

# Load zsh key-bindings
source "$ZDOTDIR/.zshbindings"

# Load zsh aliases
source "$ZDOTDIR/.zshaliases"

# Setup cargo
source "$HOME/.cargo/env"

# Setup nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Setup fzf keybindings and fuzzy completion
source <(fzf --zsh)

# Setup fzf-git
source "$HOME/.local/bin/fzf-git.sh"

# Init starship prompt
eval "$(starship init zsh)"

