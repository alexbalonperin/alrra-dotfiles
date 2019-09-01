#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "sudo nvram SystemAudioVolume=\" \"" \
  "Disable the sound effects on boot"

execute "defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false" \
  "Save to disk (not to iCloud) by default"

execute "launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null" \
  "Disable Notification Center and remove the menu bar icon"

