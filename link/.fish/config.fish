set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

# disable greeting
set -g fish_greeting

set -g autojump_fish /usr/share/autojump/autojump.fish
set -g autojump_fish_local /usr/local/share/autojump/autojump.fish

if test -f $autojump_fish
    . $autojump_fish
else if test -f $autojump_fish_local
    set -g autojump_fish $autojump_fish_local
    . $autojump_fish_local
end

  
# Where the magic happens.
set -x DOTFILES ~/.dotfiles

# Add binaries into the path
set -x PATH $DOTFILES/bin $PATH
