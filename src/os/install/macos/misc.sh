#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

#brew_install "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"
#brew_install "eyeD3" "eye-d3"
brew_install "Spectacle" "spectacle" "caskroom/cask" "cask"
brew_install "Transmission" "transmission" "caskroom/cask" "cask"
brew_install "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"
brew_install "VLC" "vlc" "caskroom/cask" "cask"
brew_install "Iterm2" "iterm2" "caskroom/cask" "cask"
brew_install "Spotify" "spotify" "caskroom/cask" "cask"
brew_install "1password" "1password" "caskroom/cask" "cask"
brew_install "IRSSI" "irssi"
brew_install "Flux.d" "flux" "caskroom/cask" "cask"
