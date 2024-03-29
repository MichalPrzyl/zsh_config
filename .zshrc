function mp_func() {
  clear
  echo "this is fucking awesome"
  zle reset-prompt
}
zle -N mp_func

function git_status() {
  clear
  git status
  zle reset-prompt
}
zle -N git_status

function list-files() {
  clear
  ls -al
  zle reset-prompt
}
zle -N list-files




# clears the shell and displays the dir tree with level 2
clear-tree-2() {
  clear
  tree -L 2
  zle reset-prompt
}
zle -N clear-tree-2


# clears the shell and displays the dir tree with level 3
clear-tree-3() {
  clear
  tree -L 3
  zle reset-prompt
}
zle -N clear-tree-3

echo "Hello Mr. Przylucki"
# bindkey '\C-x\C-e' mp_func

bindkey -s ^o "echo siema"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh themes

# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="arrow"
# ZSH_THEME="kardan"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="refined"
# ZSH_THEME="classyTouch"


plugins=(
	git
	zsh-autosuggestions
  z
)
source $ZSH/oh-my-zsh.sh

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p11k.zsh

# aliases
## git
alias st="git status"
alias gdf="git diff"
alias gdft="git difftool"
alias com="git commit"
alias coma="git commit -a"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch --show-current"
alias ga="git add"
alias ga.="git add ."
alias log="git log"
## neovim
alias nvim="/home/michal/programs/nvim/bin/nvim"
alias v="nvim"
alias vconf='cd /home/michal/.config/nvim'
alias vkeys="v ~/.config/nvim/lua/keymaps.lua"
## other
alias mc='source /usr/lib/mc/mc-wrapper.sh'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# bindkeys
bindkey '^E' mp_func
bindkey '^G' git_status
# bindkey '^L^L' list-files
bindkey '^K' list-files
bindkey '^J' clear-tree-2
bindkey '^H' clear-tree-3

