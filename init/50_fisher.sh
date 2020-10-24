if [[ ! -f ~/.config/fish/functions/fisher.fish ]]; then
    e_header "Fisher is not installed"
    read -n 1 -t $prompt_delay -p "Install fisher to ~/.config/fish/? [y/N] " install_fisher; echo
    if [[ "$install_fisher" =~ [Yy] ]]; then
        curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    fi
fi

if [[ -f ~/.config/fish/functions/fisher.fish ]]; then
    e_header "Updating fisher"
    fish -c "fisher self-update"

    e_header "Updating fisher packages"
    fish -c "fisher"
fi
