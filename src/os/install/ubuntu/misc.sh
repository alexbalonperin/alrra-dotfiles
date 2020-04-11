#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

install_package "Transmission" "transmission"
install_package "VLC" "vlc"

if ! package_is_installed "spotify-client"; then
  add_key "https://download.spotify.com/debian/pubkey.gpg" \
        || print_error "Spotify (add key)"
  add_to_source_list "http://repository.spotify.com stable non-free" "spotify.list" \
    || print_error "Spotify (add to package resource list)"

  update &> /dev/null \
    || print_error "Spotify (resync package index files)"

fi
install_package "Spotify" "spotify-client"

printf "\n"
