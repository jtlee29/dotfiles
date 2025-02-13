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
# - tmuxifier

export VISUAL="nvim"
export EDITOR="$VISUAL"
export GIT_EDITOR="nvim"

# Requires tmuxifier
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
alias tx='tmuxifier'

# Requires smart tmux session manager
# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

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
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

alias "fnvim"="fzf --height 25% --layout reverse --border | xargs nvim"

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
