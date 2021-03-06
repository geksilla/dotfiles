# -*- mode: sh -*-
# vi: set ft=sh

# {{{ ENV
export SHELL=/bin/zsh
export EDITOR="vim"
#export TERM="screen-256color"
export KEYTIMEOUT=1
# this resets <<< status for vi mode for shell session
export RPS1="%{$reset_color%}"
# }}}
# {{{ Configs
# Enables warning messages during initialize
DOT_WARNS=""
# {{{ spaceship configs
SPACESHIP_RUBY_SHOW=false
# }}}
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
  zgen oh-my-zsh plugins/go
  zgen oh-my-zsh plugins/jump
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/rvm
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/copyfile
  zgen oh-my-zsh plugins/copydir
  zgen oh-my-zsh plugins/themes
  zgen oh-my-zsh plugins/fasd

  # zgen oh-my-zsh themes/agnoster
  zgen load denysdovhan/spaceship-zsh-theme spaceship
  zgen load jimmijj/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load svenkeidel/nixos-zsh-completion

  zgen save
fi
# Autosuggestions init
# zle-line-init() {
#   zle autosuggest-start
# }

# zle -N zle-line-init

# Notification format message
bgnotify_formatted() {
  [ $1 -eq 0 ] && title="SUCCESS:" || title="ERROR:"
  bgnotify "$title $2. Finished: $3 s";
}
# }}}

# Load private section

[[ -f ~/.privaterc ]] && . ~/.privaterc


__echo() {
  [[ -n $DOT_WARNS ]] && echo -e "$@"
}
# Custom functions {{{
command_exists () {
  type "$1" &> /dev/null;
}

# helper function to set path safely
__safe_path_dir() {
    [[ -d $1 ]] && PATH=$1:$PATH || __echo "I'm not existing folder: $1"
}

# helper function to source file safely
__safe_source() {
  [[ -s $1 ]] && source $1 || __echo "I'm not existing file: $1"
}

node-watch() {
local current_node=$(nvm current)
$NVM_DIR/versions/node/$current_node/bin/watch $@

}
# PROMPT {{{
custom_prompt() {
  prompt_status
  prompt_dir
  prompt_git
  prompt_end
}

# PROMPT='%{%f%b%k%}$(custom_prompt) '
# }}}
# }}}

__safe_path_dir /usr/local/sbin
# {{{ Libs and scripts
#   {{{ Go
  export GOPATH=$HOME/Go
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
__safe_source $HOME/.nvm/nvm.sh # this loads nvm
#   }}}
#   {{{ rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load rvm
#   }}}
#   {{{ rsvm
[[ -s "$HOME/.rsvm/rsvm.sh" ]] && source "$HOME/.rsvm/rsvm.sh" # Load rsvm
#   }}}
#   {{{ Nix
__safe_source ~/.nix-profile/etc/profile.d/nix.sh
#   }}}
#   {{{ Tmuxinator completions
__safe_source $HOME/completions/tmuxinator.zsh
#   }}}
#   {{{ Third party 
__safe_path_dir $HOME/scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#   }}}
# }}}

# {{{ Aliases
alias r=". ~/.zshrc"
alias vi="vim"
alias pskill="ps aux | fzf -m | awk '{print \$2}' | xargs kill -9"
alias docker-rmi="docker images | fzf -m | awk '{print \$3}' | xargs docker rmi "
alias docker-rmif="docker images | fzf -m | awk '{print \$3}' | xargs docker rmi -f "
alias tmux="tmux -2"
alias cat="colorize"
alias npm-exec='PATH=$(npm bin):$PATH'
alias enw="emacs -nw"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias vimrc="vim ~/.vimrc"
alias j="jump"
alias gusr="g stash save -u; g pull --rebase && g stash pop"
# }}} 

# Key Bindings {{{
bindkey '^f' forward-word
bindkey '^e' end-of-line
bindkey '^I' expand-or-complete
bindkey '^s' fzf-completion
# }}}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
