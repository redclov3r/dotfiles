if [[ ! -d ~/.local/share/omf ]]; then
    e_header "Installing oh-my-fish"
    curl -L https://get.oh-my.fish | fish
fi
