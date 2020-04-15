set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

set -g autojump_fish /usr/local/share/autojump/autojump.fish
if test -f $autojump_fish
  . $autojump_fish
end
