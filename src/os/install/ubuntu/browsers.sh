#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "google-chrome-unstable"; then

    add_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" \
        || print_error "Chrome Canary (add key)"

    add_to_source_list "[arch=amd64] https://dl.google.com/linux/deb/ stable main" "google-chrome.list" \
        || print_error "Chrome Canary (add to package resource list)"

    update &> /dev/null \
        || print_error "Chrome Canary (resync package index files)"

fi

#install_package "Chrome Canary" "google-chrome-unstable"
#install_package "Chromium" "chromium-browser"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

if ! package_is_installed "firefox-trunk"; then

    add_ppa "ubuntu-mozilla-daily/ppa" \
        || print_error "Firefox Nightly (add PPA)"

    update &> /dev/null \
        || print_error "Firefox Nightly (resync package index files)"

fi

#install_package "Firefox Nightly" "firefox-trunk"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


CHROME_INSTALL_FILE="google-chrome-stable_current_amd64.deb"
installed=$(apt list --installed | grep "google-chrome-stable")
if [ -z "$installed" ]; then
  download "https://dl.google.com/linux/direct/${CHROME_INSTALL_FILE}" "/tmp/${CHROME_INSTALL_FILE}"
  install_package "Chrome" "/tmp/${CHROME_INSTALL_FILE}"
fi

printf "\n"

#install_package "Flash" "flashplugin-installer"
