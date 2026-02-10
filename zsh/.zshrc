# ~/.zshrc

# ---------- Env Vars ----------
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Ensure brew is on PATH
eval "$(brew shellenv)"
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"

# ---------- Sources ----------
# Resolve real dir of this file (follows stow symlink)
source "${0:A:h}/aws-profile.zsh"

# ---------- Aliases ----------
alias reload='source ~/.zshrc'
alias edit-zsh='nvim ~/.zshrc'
alias cp="cp -i"
alias mv="mv -i"

alias lg='lazygit'
alias ls='eza'
alias ll='eza -lah'
alias tree='eza --tree'

# ---------- ZINIT ----------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ZSH plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab # FZF for autocompletions
zinit light zsh-users/zsh-syntax-highlighting
autoload -U compinit && compinit

# ---------- Completion Styling ----------

# Case and scores insensitive autocompletions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 
# Add filename colors autocompletions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Force zsh not to show completion menu, use fzf instead
zstyle ':completion:*' menu no 

# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # Preview dirs for cd autocompletion

# ---------- History ----------
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first

bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---------- Init ----------
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
fastfetch
