# Symlink.sh

dotfiles_dir=~/dotfiles

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
