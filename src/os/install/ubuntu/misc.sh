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


# LASTPASS_FOLDER="lplinux"
# LASTPASS_ARCHIVE="$LASTPASS_FOLDER.tar.bz2"
#
# if [ ! -f "/tmp/$LASTPASS_ARCHIVE" ]; then
#   execute "curl https://download.cloud.lastpass.com/linux/$LASTPASS_ARCHIVE > /tmp/$LASTPASS_ARCHIVE" \
#     "Lastpass (Download archive)"
#
#   mkd "/tmp/$LASTPASS_FOLDER"
#   execute "sudo tar xjvf /tmp/$LASTPASS_ARCHIVE -C /tmp/$LASTPASS_FOLDER" \
#     "Lastpass (Extract archive)"
#
#   execute "cd /tmp/$LASTPASS_FOLDER && ./install_lastpass.sh" \
#     "Lastpass (Install)"
# fi
#

printf "Install 1Password\n"

execute "curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg" \
    "Add the key for the 1Password apt repository:"

execute "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list" \
    "Add the 1Password apt repository:"

execute "sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg" \
    "Add the debsig-verify policy:"

execute "sudo apt update && sudo apt install 1password" \
    "Install 1Password:"

printf "\n"
