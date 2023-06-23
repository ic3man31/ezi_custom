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
    echo -e "[!] Updating the System ..."
    echo
    sudo apt update -y && echo &&
    clear && sleep 3
    echo -e "[+] Installing Vim Editor ..."
    sudo apt install vim vim-motif vim-gtk3 -y
    sleep 3 && clear
    echo "[!] Cloning some repository from Github to install some Plugins" &&
    # Vundle - Plugin Manager
    cd ~/ && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
    # Ale - Plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8.0+ while you edit your text file
    cd ~/ && git clone https://github.com/dense-analysis/ale ~/.vim/bundle/ale &&
    # Flake8 - A static syntax and style checker for Python source code
    sudo apt install python3-flake8 && pip install flake8 &&
    cd ~/ && git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8 && cd ~/ezi_custom/ &&
    cp flake8 ~/ && mv ~/flake8 ~/.flake8 &&
    # vim-airline - Lean & mean status/tabline for vim that's light as air.
    cd ~/ && git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline &&
    # Importing colors
    cd ~/ && git clone https://github.com/dracula/vim.git ~/.vim/bundle/vim &&
    cd ~/ && git clone https://github.com/EdenEast/nightfox.nvim.git ~/.vim/bundle/nightfox.nvim &&
    cp -R ~/ezi_custom/colors/ ~/.vim/ &&
    # Importing vimrc
    cp -R ~/ezi_custom/vimrc . && mv vimrc .vimrc && 
    # Installing all the Plugin via Terminal
    vim +PluginInstall +qall &&
    echo "[+] Configuration Done ! Run: source .vimrc "
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
    sleep 3 && clear && banner; slct
}

#Installing Basic Tools 
inst_btools(){
    echo -e "[!] Installing some Basic Tools ( You can see it on b_tools file ) [..]" && sudo apt update -y &&
    for bt in $(cat b_tools); do sudo apt install $bt -y; done
}

# Banner
banner(){
     nl;
     echo -e "\e[1;32m
 _______  _______  ___         _______  __   __  _______  _______  _______  __   __
|       ||       ||   |       |       ||  | |  ||       ||       ||       ||  |_|  |
|    ___||____   ||   |       |       ||  | |  ||  _____||_     _||   _   ||       |
|   |___  ____|  ||   |       |       ||  |_|  || |_____   |   |  |  | |  ||       |
|    ___|| ______||   |       |      _||       ||_____  |  |   |  |  |_|  ||       |
|   |___ | |_____ |   | _____ |     |_ |       | _____| |  |   |  |       || ||_|| |
|_______||_______||___||_____||_______||_______||_______|  |___|  |_______||_|   |_|

\e[0m"
echo -e "\e[1;34m                              by: github/ic3man31                 \e[0m "
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
banner; slct
