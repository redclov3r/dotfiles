# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="dstufft"
#ZSH_THEME="redclover"

#multibyte character support
setopt COMBINING_CHARS 

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs="git status"
alias gco="git commit"
alias dj="python manage.py"

# Global aliases
alias -g J='| python -m json.tool'

# Searching
alias ff="grep -Iinr $1 ."

# Common directories
hash -d uni="/Users/redclover/Documents/Uni/Semester/Sommer 15/"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery colored-man git git-flow osx python django fabric vundle websearch zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/bin:/opt/X11/bin:/usr/texbin:/usr/local/share/npm/bin
#export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

export github_user="redclov3r"

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