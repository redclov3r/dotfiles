if [[ -f ~/.config/fish/functions/fisher.fish ]]; then
    e_header "Updating fisher"
    fish -c "fisher self-update"

    e_header "Updating fisher packages"
    fish -c "fisher"
fi
