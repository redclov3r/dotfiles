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


# Init rustup
set -l rustup_path $HOME/.cargo/bin

if [ $CARGO_HOME ]
  set rustup_path $CARGO_HOME/bin
end

contains -- $rustup_path $PATH
  or set -gx PATH $rustup_path $PATH


# Init Starship
if type -q starship
    starship init fish | source
end
