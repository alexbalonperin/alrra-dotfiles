#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   TLP\n\n"

if ! package_is_installed "tlp"; then
  add_ppa "linrunner/tlp"
  update &> /dev/null \
    || print_error "TLP (resync package index files)"
fi
install_package "TLP" "tlp"
install_package "TLP Radio Device Wizard" "tlp-rdw"

