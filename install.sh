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

cp $dotfiles_dir/.vimrc ~
cp $dotfiles_dir/.tmux.conf ~
cp $dotfiles_dir/.zshrc ~
cp $dotfiles_dir/.Xrecources ~
cp $dotfiles_dir/.Xrecources-light ~
cp $dotfiles_dir/lock.png ~

cp -r $dotfiles_dir/.vim/ftplugin ~/.vim/
cp -r $dotfiles_dir/.config ~

echo "Install finished"
exit 0
