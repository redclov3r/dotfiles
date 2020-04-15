# Where the magic happens.
set -x DOTFILES ~/.dotfiles

# Add binaries into the path
set -x PATH $DOTFILES/bin $PATH
