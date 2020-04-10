#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

install_package "cURL" "curl"
install_package "ShellCheck" "shellcheck"
install_package "xclip" "xclip"
install_package "Gnome Tweak Tool" "gnome-tweak-tool"
install_package "Ag" "silversearcher-ag"
install_package "HTop" "htop"
install_package "Direnv" "direnv"
execute "echo \"eval '\$(direnv hook bash)'\" >> ~/.bashrc" \
  "Hook direnv"

execute "curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > /tmp/diff-so-fancy && sudo mv /tmp/diff-so-fancy /usr/local/bin/diff-so-fancy && sudo chmod u+x /usr/local/bin/diff-so-fancy" \
  "Installing diff-so-fancy"

if [ -d "$HOME/.nvm" ]; then


    if ! package_is_installed "yarn"; then

        add_key "https://dl.yarnpkg.com/debian/pubkey.gpg" \
            || print_error "Yarn (add key)"

        add_to_source_list "https://dl.yarnpkg.com/debian/ stable main" "yarn.list" \
            || print_error "Yarn (add to package resource list)"

        update &> /dev/null \
            || print_error "Yarn (resync package index files)"

    fi

    install_package "Yarn" "yarn" "--no-install-recommends"
fi
