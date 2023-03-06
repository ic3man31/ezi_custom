# Ezi_Custom

The aim of this script is to automate the customization of a Kali Virtual Machine with XFCE Desktop Environment.
It's a very basic script.

## Requirements

- Oracle VM VirtualBox or VMware
- This script is designed for a Kali Linux Virtual Machine that has, as Desktop Environment, **XFCE**.
- The user that is going to run this script must have root privilege.

## Installation

````bash
git clone https://github.com/ic3man31/ezi_custom.git
cd ezi_custom/
chmod +x ezi_custom.sh
./ezi_custom.sh
````

## HowTo

The script has 6 option:

1. `Upgrade the System` - It will update and upgrade the System. You must have root privilege.
2. `Add new Icons and Themes` - It will add icons in /usr/share/icons and themes in /usr/share/themes. To edit icons and themes Settings >> Appearance. You can add new icons & themes from this [site](https://www.xfce-look.org/browse/)and saving it on *ezi_custom/temi* for themes and *ezi_custom/icone*.
3. `Install some Basic Tools` - It will download tools that you can see on [b_tools](b_tools). You must have sudo privilege and if you want you can add other tools by adding it on the *b_tools* file. 
4. `Change Default Shell` - Gives the change to change the default shell of the user. 
5. `Configure Vim ` - It will install Vim and configure basic .vimrc(See [vimrc](vimrc) file) No plugin.
6. `Exit` - Exit the script.


## Authors

 [J.Rosales](https://it.linkedin.com/in/johnchri-rosales31)

## License

