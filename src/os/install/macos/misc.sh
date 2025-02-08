#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

#brew_install "Android File Transfer" "android-file-transfer"
#brew_install "eyeD3" "eye-d3"
brew_install "Rectangle" "rectangle"
brew_install "Transmission" "transmission --cask"
brew_install "Unarchiver" "the-unarchiver"
brew_install "VLC" "vlc"
brew_install "Iterm2" "iterm2"
brew_install "Spotify" "spotify"
brew_install "1password" "1password"
brew_install "IRSSI" "irssi"
brew_install "Flux.d" "flux"
