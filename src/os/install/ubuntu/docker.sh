#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Docker\n\n"

install_package "Transport HTTPS" "apt-transport-https"
install_package "CA Certificates" "ca-certificates"
install_package "Software Properties Common" "software-properties-common"

add_key "https://download.docker.com/linux/ubuntu/gpg" \
    || print_error "Docker (add key)"

execute "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"" \
  "Add Docker repositories"

update

install_package "Docker" "docker-ce"
install_package "Docker CLI" "docker-ce-cli"
install_package "Containerd" "containerd.io"

execute "sudo systemctl status docker" \
  "Check Docker status"
