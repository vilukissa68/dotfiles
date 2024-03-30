#!/bin/bash

dotfiles_dir="${HOME}/dotfiles"
dotfiles_config_dir="${dotfiles_dir}/.config"
config_destination_dir="${HOME}/.config"

echo $dotfiles_config_dir

while true; do
    read -p "Do you want to set up vundle? y/n " yn
    case $yn in
        [Yy]* ) git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you want to install oh-my-zsh y/n " yn
    case $yn in
        [Yy]* ) sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you want to set up oh-my-zsh plugins y/n " yn
    case $yn in
        [Yy]* )
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &&
            git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Symlinks
ln -sf "$dotfiles_dir/.vimrc" "${HOME}/.vimrc"
ln -sf "$dotfiles_dir/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "$dotfiles_dir/.zshrc" "${HOME}/.zshrc"

# Create symlinks for each file inside subfolders
# Check if the source directory exists
if [ ! -d "$dotfiles_config_dir" ]; then
    echo "Source directory not found: $dotfiles_config_dir"
    exit 1
fi

# Check if the destination directory exists, if not, create it
if [ ! -d "$config_destination_dir" ]; then
    mkdir -p "$config_destination_dir"
fi

find "$dotfiles_config_dir" -type f | while read -r file; do
    dest_file="${HOME}/.config${file#$dotfiles_config_dir}"
    dest_folder=$(dirname "$dest_file")

    # Create destination folder if it doesn't exist
    mkdir -p "$dest_folder"

    # Create symlink
    ln -sf "$file" "$dest_file"
    echo "Created symlink: $dest_file -> $file"
done

echo "Install finished"
exit
