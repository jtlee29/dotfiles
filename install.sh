#!/usr/bin/env bash
set -e

# ---------- Homebrew ----------
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# ---------- Packages ----------
packages=(
  nvim
  eza
  zoxide
  fastfetch
  starship
  fzf
  sesh
  tmux
  n
  lazygit
  stow
  ripgrep
  go
  gopls
  vtsls
  stylua
  lua-language-server
)

echo "Installing packages..."
for pkg in "${packages[@]}"; do
  if brew list "$pkg" &>/dev/null; then
    echo "  $pkg already installed"
  else
    echo "  Installing $pkg..."
    brew install "$pkg"
  fi
done

# ---------- Casks ----------
casks=(
  kitty
  nikitabobko/tap/aerospace
)

echo "Installing casks..."
for cask in "${casks[@]}"; do
  local_name="${cask##*/}"
  if brew list --cask "$local_name" &>/dev/null; then
    echo "  $local_name already installed"
  else
    echo "  Installing $local_name..."
    brew install --cask "$cask"
  fi
done

# ---------- TPM (Tmux Plugin Manager) ----------
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed"
fi

echo "Done!"
