#!/bin/bash

# Add new line
nl() { 
    echo
}

# Error message
ermsg() {
    echo -e "\033[5;31;40mError: \033[0m\033[5;31;40mSomething goes WRONG :( !\033[m" && sleep 7 && clear && ret_menu
}

# Extract Icons
ex_icons() {
    echo -e "Adding new ICONS [...]"
    nl; sleep 2
    for ics in ~/ezi_custom/icone/*; do sudo tar -C /usr/share/icons -xvf $ics; done && clear
}

# Extract Themes
ex_themes() {
    echo -e "Adding new THEMES [...]"
    nl; sleep 2
    for temi in ~/ezi_custom/temi/*; do sudo tar -C /usr/share/themes -xvf $temi; done && for temizip in  ~/ezi_custom/temi/*.zip; do sudo unzip -d /usr/share/themes $temizip; done && clear
}

# Configuration VIM and .vimrc
conf_vim(){
    nl;
    echo -e "Installing VIM [...]";
    sudo apt update -y && sudo apt install vim vim-motif vim-gtk3 -y &&
    cp ~/ezi_custom/vimrc ~/.vimrc && nl && echo -e "Configuration Done [+]"
}

# Change Default Shell
ch_defshell(){
    nl;
    printf "My current shell - %s\n" "$SHELL";
    cat /etc/shells && nl;
    echo -e "Do you want to change your shell? If YES which one? Enter the PATH: \c"
    read shell
    echo -e "Enter username: \c"
    read username
    sudo chsh -s $shell $username && sleep 2;
    echo -e "Now, the next time you'll login your default shell should be changed. Do you want to restart the system now?[y/n]: \c"
    read restart
    if [ $restart == "y" ]; then
        init 6
    elif [ $restart == "n" ]; then
        ret_menu
    fi
}

# Upgrade the System
upg_sys(){
    nl;
    echo -e "[!] Upgrading the System [..]"
    sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y
}

# Back to Menu
ret_menu(){
    sleep 3 && clear && bnr; slct
}

#Installing Basic Tools 
inst_btools(){
    echo -e "[!] Installing some Basic Tools ( You can see it on b_tools file ) [..]" && sudo apt update -y &&
    for bt in $(cat b_tools); do sudo apt install $bt -y; done
}

# Banner
banner(){
     nl;
   echo "+------------------------------------------+"
   printf "| %-40s |\n" "`date`"
   echo "|                                          |"
   echo -e "| \033[1;32;40mEasy-Custom\033[m   "
   echo "|                                          |"
   printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
   echo "+------------------------------------------+"
}

bnr(){
    banner "Written by: J.Rosales"
}

slct(){
    nl;
    PS3="
Please, select an option:"
    nl;
    options=("Upgrade the System" "Add new Icons and Themes" "Install some Basic Tools" "Change Default Shell" "Configure Vim" "Exit")
    select menu in "${options[@]}"
    do
        case $menu in
            "Upgrade the System")
                nl;
                echo -e "[!] It will upgrade the System. Do you want to proceed? [y/n]: \c"
                read cont
                if [$cont == "y" ]; then
                    upg_sys && ret_menu || ermsg
                elif [$cont == "n" ]; then
                    ret_menu
                fi
                ;;
            "Add new Icons and Themes")
                nl;
                ex_icons && ex_themes && echo -e "[+] You can see new ICONS and Themes in Settings >> Appearance" && ret_menu || ermsg
                ;;
            "Install some Basic Tools")
                nl;
                inst_btools && ret_menu || ermsg
                ;;
            "Change Default Shell")
                nl;
                ch_defshell && ret_menu || ermsg
                ;;
            "Configure Vim")
                nl;
                conf_vim && ret_menu || ermsg
                ;;
            "Exit")
                nl;
                echo -e "[+] Exiting ... Thank you. Bye !"
                exit;
        ;;
        esac
    done
}
bnr; slct
