# ~/.zshrc
#
# ---- Requirements ----
# - neovim
# - eza
# - zoxide
# - fzf
# - nvm
#

export VISUAL="nvim"
export EDITOR="$VISUAL"


# Requires eza package
alias ls='eza'
alias ll='eza -lah'
alias tree='eza --tree'

source /usr/share/nvm/init-nvm.sh
source ~/.npm-token
source ~/.zshrc-tetra

source <(fzf --zsh)     # verify this works for arch
eval "$(zoxide init --cmd cd zsh)"

eval "$(starship init zsh)"
pfetch
