#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/aliases/bash_aliases"
        "shell/autocomplete/$(get_os)/bash_autocomplete"
        "shell/bash_exports"
        "shell/bash_functions"
        "shell/bash_logout"
        "shell/bash_options"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bashrc"
        "shell/curlrc"
        "shell/inputrc"

        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"

        "tmux/tmux.conf"

        "irssi/irssi"

        "psql/psqlrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi

    done

}

create_other_symlinks() {

    declare -a FILES_TO_SYMLINK=(
      "vim/init.vim"
      "vim/coc-settings.json"
      "spectacle/spectacle.json"
    )

    declare -a TARGETS_FOR_SYMLINK=(
      "$HOME/.config/nvim/init.vim"
      "$HOME/.config/nvim/coc-settings.json"
      "$HOME/Library/Application\ Support/Spectacle/Shortcuts.json"
    )

    local i=0
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false
    local len=${#FILES_TO_SYMLINK[@]}

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    for (( i=0; i< len; i++ )); do
        sourceFile="$(cd .. && pwd)/${FILES_TO_SYMLINK[$i]}"
        targetFile="${TARGETS_FOR_SYMLINK[$i]}"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
    create_other_symlinks "$@"
}

main "$@"
