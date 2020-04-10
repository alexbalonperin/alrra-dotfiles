#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Java\n\n"

execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9" \
  "Add Zulu key"

execute "sudo apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'" \
  "Add Zulu Repositories"

update

install_package "Java11 Installer" "zulu-11"

execute "java -version" \
  "Java Version"
