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

sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/.Xdefaults > /dev/null 2>&1
sudo rm -r ~/lock.png > /dev/null 2>&1

cp $dotfiles_dir/.vimrc ~
cp $dotfiles_dir/.tmux.conf ~
cp $dotfiles_dir/.zshrc ~
cp $dotfiles_dir/.Xdefaults ~
cp $dotfiles_dir/lock.png ~

cp -r $dotfiles_dir/.vim ~
cp -r $dotfiles_dir/.config ~

echo "Install finished"
