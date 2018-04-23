# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="dstufft"
#ZSH_THEME="redclover"

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}

#multibyte character support
setopt COMBINING_CHARS 

# Quickly create python packages
pyp() {
	mkdir $1
	cd $1
	touch __init__.py
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Better completion for cd ../
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# Config for virtualenvwrapper
WORKON_HOME="~/.virtualenvs"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery colored-man git git-flow gitignore osx python django fabric vundle virtualenvwrapper websearch zsh-syntax-highlighting yarn)

# Some legacy bindings for vi mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs="git status"
unalias gf
alias gf="git flow"
alias dj="python manage.py"
alias dockenv="eval \"\$(docker-machine env default)\""

# Global aliases
alias -g J='| python -m json.tool'

# Searching
alias ff="grep -Iinr $1 ."

# Common directories
hash -d uni="/Users/redclover/Documents/Uni/Semester/Sommer 15/"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/bin:/opt/X11/bin:/usr/texbin:/usr/local/share/npm/bin
#export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH=/usr/local/texlive/2014/bin/x86_64-darwin:$PATH

if [[ -f /usr/share/autojump/autojump.zsh ]]; then
    . /usr/share/autojump/autojump.zsh
fi
if [[ -f /usr/local/etc/profile.d/autojump.sh ]]; then
    . /usr/local/etc/profile.d/autojump.sh
fi

export github_user="redclov3r"

if [ $TERMINIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi


# Where the magic happens.
export DOTFILES=~/.dotfiles

# Add binaries into the path
PATH=$DOTFILES/bin:$PATH
export PATH

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
