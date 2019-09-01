#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {
    execute "nvim --headless +PlugUpgrade +PlugInstall +UpdateRemotePlugins +qa" \
      "Install plugins"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


main() {

    print_in_purple "\n   Vim\n\n"

    "./$(get_os)/vim.sh"
    install_plugins

}

main
