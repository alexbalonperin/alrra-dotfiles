#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {
    execute "nvim --headless +PlugUpgrade +PlugInstall +UpdateRemotePlugins +qa" \
      "Install plugins"
}

install_vimplug() {

    execute "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" \
      "Install vim-plug"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


main() {

    print_in_purple "\n   Vim\n\n"

    "./$(get_os)/vim.sh"
    install_vimplug
    install_plugins

}

main
