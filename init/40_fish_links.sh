read -n 1 -t $prompt_delay -p "Link config.fish, fishfile and fish_variables to ~/.config/fish/? [y/N] " link_fish; echo
if [[ "$link_fish" =~ [Yy] ]]; then
    ln -s ~/.fish/config.fish ~/.config/fish/config.fish
    ln -s ~/.fish/fishfile ~/.config/fish/fishfile
    ln -s ~/.fish/fish_variables ~/.config/fish/fish_variables
fi
