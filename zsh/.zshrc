# ~/.zshrc
#
# ---- Requirements ----
# - neovim
# - eza
# - zoxide
# - fzf
# - nvm
# - yazi
# - lazygit

export VISUAL="nvim"
export EDITOR="$VISUAL"


# Requires eza package
alias ls='eza'
alias ll='eza -lah'
alias tree='eza --tree'

# Requires lazygit package
alias lg='lazygit'

source /usr/share/nvm/init-nvm.sh
source ~/.npm-token
source ~/.zshrc-tetra

source <(fzf --zsh)     # verify this works for arch
eval "$(zoxide init --cmd cd zsh)"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(starship init zsh)"
pfetch
