#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Programming\n\n"

if ! package_is_installed "zulu-11"; then
  execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9" \
    "Add Zulu key" \
    || print_error "Java11 (add key)"

  execute "sudo apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'" \
    "Add Zulu Repositories" \
    || print_error "Java11 (add to package resource list)"

  update &> /dev/null \
    || print_error "Java11 (resync package index files)"

fi
install_package "Java11" "zulu-11"

execute "java -version" \
  "Java Version"

printf "\n"

if ! package_is_installed "sbt"; then
  add_to_source_list "https://dl.bintray.com/sbt/debian" "sbt.list" \
    || print_error "Sbt (add to package resource list)"

  add_key "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" \
    || print_error "Sbt (add key)"

  update &> /dev/null \
    || print_error "Sbt (resync package index files)"

fi

install_package "Sbt" "sbt"
