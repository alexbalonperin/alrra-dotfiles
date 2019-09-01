#!/bin/bash

execute "fdesetup enable" \
  "Enable FileVault"

execute "/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on" \
  "Enable Firewall"
