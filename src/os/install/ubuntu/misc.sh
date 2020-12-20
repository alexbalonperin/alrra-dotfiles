#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

install_package "Transmission" "transmission"
install_package "VLC" "vlc"
install_package "IRSSI" "irssi"

execute "curl https://scripts.irssi.org/scripts/dccstat.pl > ~/.irssi/scripts/autorun/dccstat.pl" \
  "IRSSI (Download dccstat script)"

if ! package_is_installed "spotify-client"; then
  add_key "https://download.spotify.com/debian/pubkey_0D811D58.gpg" \
    || print_error "Spotify (add key)"

  add_to_source_list "http://repository.spotify.com stable non-free" "spotify.list" \
    || print_error "Spotify (add to package resource list)"

  update &> /dev/null \
    || print_error "Spotify (resync package index files)"

fi
install_package "Spotify" "spotify-client"


LASTPASS_FOLDER="lplinux"
LASTPASS_ARCHIVE="$LASTPASS_FOLDER.tar.bz2"

if [ ! -f "/tmp/$LASTPASS_ARCHIVE" ]; then
  execute "curl https://download.cloud.lastpass.com/linux/$LASTPASS_ARCHIVE > /tmp/$LASTPASS_ARCHIVE" \
    "Lastpass (Download archive)"

  mkd "/tmp/$LASTPASS_FOLDER"
  execute "sudo tar xjvf /tmp/$LASTPASS_ARCHIVE -C /tmp/$LASTPASS_FOLDER" \
    "Lastpass (Extract archive)"

  execute "cd /tmp/$LASTPASS_FOLDER && ./install_lastpass.sh" \
    "Lastpass (Install)"
fi

printf "\n"
