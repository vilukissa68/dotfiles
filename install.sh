# Symlink.sh

dotfiles_dir=~/dotfiles

while true; do
    read -p "Do you want to set up vundle? y/n " yn
    case $yn in
        [Yy]* ) git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you want to set up zsh plugins y/n " yn
    case $yn in
        [Yy]* ) git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
            ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


cp $dotfiles_dir/.vimrc ~
cp $dotfiles_dir/.tmux.conf ~
cp $dotfiles_dir/.zshrc ~
cp $dotfiles_dir/.Xresources ~
cp $dotfiles_dir/.Xresources-light ~
cp $dotfiles_dir/lock.png ~
cp $dotfiles_dir/spacemacs ~

cp -r $dotfiles_dir/.vim/ftplugin ~/.vim/
cp -r $dotfiles_dir/.config ~

echo "Install finished"
exit 0
