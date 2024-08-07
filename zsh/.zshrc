# ~/.zshrc

export VISUAL="nvim"
export EDITOR="$VISUAL"


alias la="ls -lah"


source /usr/share/nvm/init-nvm.sh
source ~/.npm-token
source ~/.zshrc-tetra

eval "$(starship init zsh)"

pfetch
