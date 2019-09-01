#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_config() {
  execute "ln -s ./vim/init.vim $HOME/.config/nvim/init.vim" \
    "Copy nvim config"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {
    execute "nvim --headless +PlugUpgrade +PlugInstall +UpdateRemotePlugins +qa" \
      "Install plugins"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_metals() {
  brew_tap "coursier/formulas"
  brew_install "Coursier" "coursier/formulas/coursier"
  execute "coursier bootstrap \
              --java-opt -Xss4m \
              --java-opt -Xms100m \
              --java-opt -Dmetals.client=coc.nvim \
              org.scalameta:metals_2.12:0.7.0 \
              -r bintray:scalacenter/releases \
              -r sonatype:snapshots \
              -o /usr/local/bin/metals-vim -f" \
    "Generate metals binary"

  execute "cp ./vim/coc-settings.json $HOME/.config/nvim/coc-settings.json" \
    "Copy nvim config"


}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Vim\n\n"

    "./$(get_os)/vim.sh"
    copy_config
    install_plugins
    install_metals

}

main
