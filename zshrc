# -*- mode: sh -*-
# vi: set ft=sh

# {{{ ENV
export SHELL=/bin/zsh
export EDITOR="vim"
export TERM=xterm-256color
# }}}

# {{{ PLugins
source "$HOME/scripts/zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/bgnotify
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/jump
  zgen oh-my-zsh plugins/colored-man
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/rvm
  zgen oh-my-zsh plugins/go
  zgen oh-my-zsh plugins/vi-mode

  zgen oh-my-zsh themes/miloshadzic
  zgen load jimmijj/zsh-syntax-highlighting
  zgen load tarruda/zsh-autosuggestions

  zgen save
fi

# Autosuggestions init
zle-line-init() {
  zle autosuggest-start
}

zle -N zle-line-init

# Notification format message
bgnotify_formatted() {
  [ $1 -eq 0 ] && title="SUCCESS:" || title="ERROR:"
  bgnotify "$title $2. Finished: $3 s";
}
# }}}

# Load private section

[[ -f ~/.privaterc ]] && . ~/.privaterc

# Key Bindings {{{
bindkey '^f' vi-forward-word
bindkey '^e' vi-end-of-line
# }}}

# Custom functions {{{
command_exists () {
  type "$1" &> /dev/null;
}

# helper function to set path safely
__safe_path_dir() {
    [[ -d $1 ]] && PATH=$1:$PATH
}
# }}}

# {{{ Libs and scripts
#   {{{ Go
  export GOPATH=$HOME/Go
  export GOBIN=$HOME/Go/bin
  export PATH=$PATH:$GOPATH/bin
#   }}}
#   {{{ Python

__init_pyenv() {
  
  if [[ -d $HOME/.pyenv ]]; then 
    __safe_path_dir $HOME/.pyenv/bin
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
}
__init_pyenv
#   }}}
#   {{{ Clojure
__safe_path_dir $HOME/.lein
#   }}}
#   {{{ Linux Brew
__safe_path_dir $HOME/.linuxbrew/bin
__safe_path_dir $HOME/.linuxbrew/sbin
#   }}}
#   {{{ nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" # This loads nvm
#   }}}
#   {{{ rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load rvm
#   }}}
#   {{{ rsvm
[[ -s "$HOME/.rsvm/rsvm.sh" ]] && source "$HOME/.rsvm/rsvm.sh" # Load rsvm
#   }}}
#   {{{ Third party 
__safe_path_dir $HOME/scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#   }}}
# }}}

# {{{ Aliases
alias r=". ~/.zshrc"
alias vi="vim"
alias pskill="ps aux | fzf | awk '{print \$2}' | xargs kill -9"
alias tmux="tmux -2"
alias cat="colorize"
alias npm-exec='PATH=$(npm bin):$PATH'
alias enw="emacs -nw"
# }}} 
