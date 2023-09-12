# Ezi_custom

This script is designed to simplify and automate various system configuration tasks. It provides a menu-based interface for performing common system tasks such as upgrading the system, adding new icons and themes, installing basic tools, changing the default shell, and configuring the Vim text editor.

## Usage

1. Clone this repository to your local machine.

`git clone https://github.com/your-username/your-repo.git`

2. Navigate to the directory where the script is located.

`cd your-repo`

3. Make the script executable.

`chmod +x custom_config.sh`

4. Run the script.

`./custom_config.sh`

## Script Functions

### 1. Upgrade the System

This option upgrades the system by updating packages, upgrading packages, and removing unnecessary packages.

### 2. Add New Icons and Themes

This option allows you to add new icons and themes to your system. The script will extract icons and themes from the specified directories and apply them to your system's settings.

### 3. Install Some Basic Tools

This option installs a list of basic tools. You can customize the list of tools by editing the `b_tools` file.

### 4. Change Default Shell

You can change the default shell for a user using this option. It will prompt you to enter the shell path and the username for which you want to change the default shell.

### 5. Configure Vim

This option automates the configuration of the Vim text editor. It updates the system, installs Vim, and installs various plugins and configurations for Vim, including Vundle, Ale, Flake8, vim-airline, and custom colors and settings.

### 6. Exit

This option exits the script.

## Important Notes

- Make sure you run this script with appropriate permissions, as some operations require superuser privileges (e.g., installing packages).
- Review and customize the list of basic tools in the `b_tools` file to suit your needs.
- Before using the script, ensure that you have backed up any important data, as system changes and upgrades can have unexpected consequences.
- This script was created by github/ic3man31.

## Disclaimer

Use this script at your own risk. While it aims to simplify system configuration tasks, it may not cover all scenarios or distributions. Always ensure you have backups and understand the changes the script will make to your system before running it.

## Credits


This script was created by [github.com/ic3man31](https://github.com/ic3man31).

Please feel free to provide any feedback or suggestions for improvement.
