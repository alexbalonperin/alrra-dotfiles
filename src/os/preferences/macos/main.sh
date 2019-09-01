#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.

./close_system_preferences_panes.applescript

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./app_store.sh
./chrome.sh
./dock.sh
./energy_saver.sh
./finder.sh
./firefox.sh
./keyboard.sh
./language_and_region.sh
./maps.sh
./misc.sh
./photos.sh
./safari.sh
./security.sh
./terminal.sh
./textedit.sh
./trackpad.sh
./transmission.sh
./ui_and_ux.sh
