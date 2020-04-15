if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]]; then
    e_header "Installing vim-plug for neovim"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 
