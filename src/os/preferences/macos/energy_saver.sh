#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Energy Saver\n\n"

execute "pmset -a lidwake 1" \
  "Enable lid wakeup"

execute "pmset -a autorestart 1" \
  "Restart automatically on power loss"

execute "systemsetup -setrestartfreeze on" \
  "Restart automatically if the computer freezes"

execute "pmset -a displaysleep 15" \
  "Sleep the display after 15 minutes"

execute "pmset -c sleep 0" \
  "Disable machine sleep while charging"

execute "pmset -b sleep 5" \
  "Set machine sleep to 5 minutes on battery"

execute "pmset -a standbydelay 86400" \
  "Set standby delay to 24 hours (default is 1 hour)"

execute "systemsetup -setcomputersleep Off > /dev/null" \
  "Never go into computer sleep mode"

execute "pmset -a hibernatemode 0" \
  "Hibernation mode" \
  "0: Disable hibernation (speeds up entering sleep mode)" \
  "3: Copy RAM to disk so the system state can still be restored in case of a power failure"
