#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "fdesetup enable" \
  "Enable FileVault"

execute "/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on" \
  "Enable Firewall"
