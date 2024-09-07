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

function print_wd() {
  clear
  pwd
  zle reset-prompt
}
zle -N print_wd

# Clears the shell and displays the dir tree with level 2.
clear-tree-2() {
  clear
  tree -L 2
  zle reset-prompt
}
zle -N clear-tree-2


# Clears the shell and displays the dir tree with level 3.
clear-tree-3() {
  clear
  tree -L 3
  zle reset-prompt
}
zle -N clear-tree-3


# Splashscreen.
echo "
  _   _      _ _         __  __        ____                 _            _    _ 
 | | | | ___| | | ___   |  \/  |_ __  |  _ \ _ __ _____   _| |_   _  ___| | _(_)
 | |_| |/ _ \ | |/ _ \  | |\/| | '__| | |_) | '__|_  / | | | | | | |/ __| |/ / |
 |  _  |  __/ | | (_) | | |  | | |    |  __/| |   / /| |_| | | |_| | (__|   <| |
 |_| |_|\___|_|_|\___/  |_|  |_|_|    |_|   |_|  /___|\__, |_|\__,_|\___|_|\_\_|
                                                      |___/                     
What can I do for you today, sir?"

# bindkey '\C-x\C-e' mp_func

bindkey -s ^o "echo siema"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="arrow"
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
alias gc-.='git checkout -- .'

## neovim
alias nvim="/home/michal/programs/nvim/bin/nvim"
alias v="nvim"
alias vconf='cd /home/michal/.config/nvim'
alias vkeys="v ~/.config/nvim/lua/keymaps.lua"

## other
alias mc='source /usr/lib/mc/mc-wrapper.sh'
alias zshe='nvim ~/.zshrc'
alias sz='clear; source ~/.zshrc'
alias cs='create-script.sh'
alias csp='create-python-script.sh'
alias md='source create-dir.sh'

# docker
alias dk='docker'
alias dkp='docker ps'
alias dkpa='docker ps -a'
alias dkpaq='docker ps -a -q'
alias dkb='docker build -t'
alias dkbnc='docker build --no-cache -t'
alias dkr='docker run --rm'
alias dkrti='docker run --rm -it'
alias dkrd='docker run -d'
alias dks='docker start'
alias dkt='docker stop'
alias dktt='docker stop $(docker ps -q)' # stop all runnninng containers
alias dkk='docker kill'
alias dkkk='docker kill $(docker ps -q)'
alias dkrm='docker rm'
alias dkri='docker rmi'
alias dke='docker exec -ti'
alias dkl='docker logs -f'
alias dki='docker images'
alias dkpu='docker pull'
alias dkph='docker push'
alias dkin='docker inspect'
alias dkn='docker network'
alias dkc='docker compose'
alias dkcu='docker compose up'
alias dkclean='docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi'
alias dkcc='docker rm $(docker ps -a -q)'
alias dkci='docker rmi $(docker images -q)'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim motions in terminal.
bindkey -v

# End of lines configured by zsh-newuser-install

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# TODO Move those function at the end of the file so the other sources can be loaded
function list-files() {
  clear
  ls -l
  zle reset-prompt
}
zle -N list-files

# bindkeys
bindkey '^E' mp_func
bindkey '^G' git_status
# bindkey '^L^L' list-files
bindkey '^K' list-files
bindkey '^J' clear-tree-2
bindkey '^H' clear-tree-3
bindkey '^P' print_wd
export PATH="$PATH:/home/michal/bin"

# load local config if exists
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

alias cd='cd_and_ls'

cd_and_ls() {
    if [ -z "$1" ]; then
        builtin cd
    else
        builtin cd "$1" && ls -al
    fi
}
