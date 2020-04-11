#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Docker\n\n"

install_package "Transport HTTPS" "apt-transport-https"
install_package "CA Certificates" "ca-certificates"
install_package "Software Properties Common" "software-properties-common"


if ! package_is_installed "docker-ce"; then
  execute "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"" \
    "Add Docker repositories" \
    || print_error "Docker (add to repositories)"

  add_key "https://download.docker.com/linux/ubuntu/gpg" \
    || print_error "Docker (add key)"

  update &> /dev/null \
    || print_error "Docker (resync package index files)"

fi

install_package "Docker" "docker-ce"
install_package "Docker CLI" "docker-ce-cli"
install_package "Containerd" "containerd.io"

execute "sudo systemctl status docker" \
  "Check Docker status"


print_in_purple "\n   Docker Compose\n\n"
DOCKER_COMPOSE_PATH="/usr/local/bin/docker-compose"
if [ -f "$DOCKER_COMPOSE_PATH" ]; then
  execute "sudo curl -L \"https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)\" -o $DOCKER_COMPOSE_PATH" \
    "Install Docker Compose"

  execute "sudo chmod +x $DOCKER_COMPOSE_PATH" \
    "Make Docker Compose executable"

  execute "sudo usermod -a -G docker $USER" \
    "Add current user to docker"
else
  print_success "Docker Compose already installed"
fi

