#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

brew_install "ShellCheck" "shellcheck"
brew_install "Tree" "tree"
brew_install "Watch" "watch"
brew_install "Java" "java" "caskroom/cask" "cask"
brew_install "Scala" "scala"
brew_install "Sbt" "sbt"
brew_install "Ag" "the_silver_searcher"
brew_install "Diff so fancy" "diff-so-fancy"
brew_install "JQ" "jq"
brew_install "Tor" "tor"
brew_install "Docker" "docker"
#brew_install "Docker Compose" "docker-compose"
brew_install "Direnv" "direnv"
#brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"

#if [ -d "$HOME/.nvm" ]; then
#    brew_install "Yarn" "yarn"
#fi
