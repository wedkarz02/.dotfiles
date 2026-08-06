#!/usr/bin/env bash

set -euo pipefail

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

log() { echo -e "${GREEN}[INFO]${NC}: $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC}: $1"; }
error() {
  echo -e "${RED}[ERROR]${NC}: $1"
  exit 1
}

DNF_PACKAGES=(
  gcc
  zsh
  stow
  tmux
  neovim
  fd-find
  ripgrep
  fzf
  bat
  git-delta
  btop
  tokei
)

STEPS=(
  "packages"
  "zsh"
  "starship"
  "tmux"
  "keyd"
  "bat"
  "fzf-git"
  "btop"
  "stow"
)

FORCE=false
ONLY_STEPS=()

while [[ $# -gt 0 ]]; do
  case $1 in
  --force)
    FORCE=true
    shift
    ;;
  --only)
    shift
    while [[ $# -gt 0 && ! $1 =~ ^-- ]]; do
      if [[ " ${STEPS[@]} " =~ " ${1} " ]]; then
        ONLY_STEPS+=("$1")
      else
        error "Unknown step: $1. Available steps: ${STEPS[*]}"
      fi
      shift
    done
    ;;
  --help)
    echo "Usage: $0 [--force] [--only STEP...]"
    echo ""
    echo "Options:"
    echo "  --force         Skip the confirmation prompt"
    echo "  --only STEP...  Run only specific steps"
    echo ""
    echo "Available steps:"
    echo "  packages   - Install all packages (dnf, rust, nvm, etc.)"
    echo "  zsh        - Setup Zsh and install plugins (zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions)"
    echo "  starship   - Install Starship prompt"
    echo "  tmux       - Setup Tmux with TPM and Catppuccin theme"
    echo "  keyd       - Configure keyd key remapper"
    echo "  bat        - Install Catppuccin theme for bat"
    echo "  fzf-git    - Setup fzf-git.sh"
    echo "  btop       - Install Catppuccin theme for btop"
    echo "  stow       - Stow dotfiles"
    echo ""
    echo "Examples:"
    echo "  $0                        # Run full setup"
    echo "  $0 --force                # Run full setup without confirmation"
    echo "  $0 --only tmux            # Only setup tmux"
    echo "  $0 --only zsh starship    # Only setup Zsh and Starship"
    exit 0
    ;;
  *)
    error "Unknown option: $1. Use --help for usage information."
    ;;
  esac
done

should_run() {
  local step=$1
  if [[ ${#ONLY_STEPS[@]} -eq 0 ]]; then
    return 0
  fi
  if [[ " ${ONLY_STEPS[@]} " =~ " ${step} " ]]; then
    return 0
  fi
  return 1
}

confirm_setup() {
  if [[ "$FORCE" == true ]]; then
    log "Running in force mode - skipping confirmation"
    return
  fi

  echo ""
  echo -e "${RED}WARNING${NC}"
  echo -e "This script will:"
  echo -e " - Install system packages (requires sudo)"
  echo -e " - Change your default shell to ZSH"
  echo -e " - Modify system configuration files"
  echo -e " - Create symlinks that may overwrite existing dotfiles"
  echo -e " - Install and configure various tools"
  echo ""
  echo -e "This could potentially overwrite or modify existing"
  echo -e "configurations. Make sure you have backups!"
  echo ""
  read -p "Are you sure you want to continue? [y/N] " -n 1 -r
  echo ""
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    error "Setup cancelled by user"
  fi
  log "Confirmation received, proceeding with setup..."
  echo ""
}

ensure_sudo() {
  if ! sudo -v; then
    error "This script requires sudo access for some operations"
  fi
}

install_packages() {
  log "Installing RPM packages"
  sudo dnf group install -y development-tools
  sudo dnf install -y "${DNF_PACKAGES[@]}"

  log "Installing COPR packages"
  sudo dnf copr enable -y scottames/ghostty
  sudo dnf install -y ghostty
  sudo dnf copr enable -y alternateved/keyd
  sudo dnf install -y keyd

  log "Installing Rust toolchain"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

  log "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
}

setup_zsh() {
  log "Setting up Zsh"
  sudo chsh -s "$(command -v zsh)" "$USER"

  XDG_CONFIG_HOME="$HOME/.config"
  ZDOTDIR="$XDG_CONFIG_HOME/zsh"
  ZPLUGINS="$ZDOTDIR/plugins"

  log "Installing default Zsh plugins (zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions)"
  [ ! -d "$ZPLUGINS" ] && mkdir -p "$ZPLUGINS"
  [ ! -d "$ZPLUGINS/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZPLUGINS/zsh-autosuggestions"
  [ ! -d "$ZPLUGINS/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZPLUGINS/zsh-syntax-highlighting"
  [ ! -d "$ZPLUGINS/zsh-completions" ] && git clone https://github.com/zsh-users/zsh-completions.git "$ZPLUGINS/zsh-completions"
}

setup_starship() {
  log "Setting up Starship"
  curl -sS https://starship.rs/install.sh | sh -s -- -y
}

setup_tmux() {
  log "Setting up Tmux"
  mkdir -p "$HOME/.config/tmux/plugins"

  if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
  else
    warn "TPM already installed, skipping"
  fi

  if [ ! -d "$HOME/.config/tmux/plugins/catppuccin/tmux" ]; then
    git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin/tmux"
  else
    warn "Catppuccin tmux theme already installed, skipping"
  fi
}

setup_keyd() {
  log "Setting up keyd"
  sudo mkdir -p /etc/keyd
  sudo tee /etc/keyd/default.conf >/dev/null <<'EOF'
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
esc = capslock
EOF
  sudo systemctl enable keyd --now
}

setup_bat() {
  log "Setting up bat"
  BAT_CONFIG_DIR="$(bat --config-dir)"
  mkdir -p "$BAT_CONFIG_DIR/themes"
  wget -P "$BAT_CONFIG_DIR/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
  bat cache --build
}

setup_fzf_git() {
  log "Setting up fzf-git"
  mkdir -p "$HOME/.local/bin"
  wget -P "$HOME/.local/bin" https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
}

setup_btop() {
  log "Setting up btop"
  mkdir -p "$HOME/.config/btop/themes"
  wget -P "$HOME/.config/btop" https://github.com/catppuccin/btop/releases/download/1.0.0/themes.tar.gz
  tar xf "$HOME/.config/btop/themes.tar.gz" -C "$HOME/.config/btop"
  rm "$HOME/.config/btop/themes.tar.gz"
}

stow_dotfiles() {
  log "Stowing dotfiles"
  stow */
}

main() {
  local original_dir="$(pwd)"
  local dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  cd "$dotfiles_dir"

  confirm_setup

  if should_run "packages"; then
    ensure_sudo
    install_packages
  fi

  if should_run "keyd"; then
    ensure_sudo
    setup_keyd
  fi

  if should_run "zsh"; then
    ensure_sudo
    setup_zsh
  fi

  should_run "starship" && setup_starship
  should_run "tmux" && setup_tmux
  should_run "bat" && setup_bat
  should_run "fzf-git" && setup_fzf_git
  should_run "btop" && setup_btop
  should_run "stow" && stow_dotfiles

  cd "$original_dir"
  log "Restart the shell to complete the setup"
}

main "$@"
