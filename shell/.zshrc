if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
export ZSH="/Users/devin/.oh-my-zsh"

# use berw 10k
# ZSH_THEME="robbyrussell"
plugins=(git)

# source berw zsh plugins
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
.$(brew --prefix)/etc/profile.d/z.sh

# Alias
alias vim="nvim"
alias ls="lsd"
alias ll="lsd -lh"
alias ide="tmux split-window -v -p 30
tmux split-window -h -p 66
tmux split-window -h -p 50"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
