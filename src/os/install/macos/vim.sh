#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

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

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Neovim" "neovim"
brew_install "Python" "python"

# install_metals
