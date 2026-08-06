# NOTE: Plugins live in $ZPLUGINS (most likely ~/.config/zsh/plugins).
#       Remember to clone plugin repos to $ZPLUGINS before sourcing '.zshrc'.
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

for plugin in "${plugins[@]}"; do
  source "$ZPLUGINS/$plugin/$plugin.zsh"
done

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

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

