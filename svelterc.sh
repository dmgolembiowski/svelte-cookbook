#!/bin/bash
# To add to one's bashrc for quick app creation
function sva() {
    local cwd="$( pwd  )"
    # Building a Svelte application

    local num_arguments=$#
    local app_name=""

    # Catch the name to use

    if [ $num_arguments -lt 1 ]; then
        app_name=${PWD##*/} ;
    else
        if [ $num_arguments -gt 2 ]; then
            echo -e "Could not create a Svelte project with that name."
            echo -e "Please remove any spaces and try again.\n"
            return 1
        fi
        for title in "$@"; do
            app_name+="$title"
        done
    fi

    mkdir -p $app_name
    cd $app_name
    wget -4 -r -nH -np -R "index.html?*" https://dgolembiowski.com/sv/
    mv sv/* . && rm -rf $cwd/dgolembiowski.com/ && ( rm -r ./sv || echo "" )
    echo -e "\nSuccessfully created a new Svelte Application"
}
export sva
