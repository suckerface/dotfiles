#!/bin/zsh

# This script will symlink dotfiles from the git repo directory to their appropriate locations in the user's home directory

RED='\033[0;31m'
NC='\033[0m'

# Variable declarations
# sets CWD variable to current directory
CWD=$(pwd)
#P10K=~/.p10k.zsh
#TMUX=~/.tmux.conf
#VIM=~/.vimrc
#ZSH=~/.zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# The next line is needed to automatically pull submodules included in the repo
git submodule update --init --recursive

#if test -f "$P10K"; then
#        echo "$P10k exists, creating backup"
#        cp ~/.p10k.zsh ~/.p10k.zsh.bak
#fi
#
#if test -f "$TMUX"; then
#        echo "$TMUX exists, creating backup"
#        cp ~/.tmux.conf ~/.tmux.conf.bak
#fi
#
#if test -f "$VIM"; then
#        echo "$VIM exists, creating backup"
#        cp ~/.vimrc ~/.vimrc.bak
#fi
#
#if test -f "$ZSH"; then
#        echo "$ZSH exists, creating backup"
#        cp ~/.zsh ~/.zsh.bak
#fi

# Symlinks files from repo to home directories
ln -is $CWD/.applemusic $HOME
ln -is $CWD/.battery.sh $HOME
ln -is $CWD/.p10k.zsh $HOME
ln -is $CWD/.tmux.conf $HOME
ln -is $CWD/.vimrc $HOME
ln -is $CWD/.zshrc $HOME

echo "If your prompt has unknown characters, run ${RED}'p10k configure'${NC} and answer ${RED}'Y'${NC} at the prompt to install the Meslo Nerd Font"

ln -is $CWD/.oh-my-zsh $HOME/.oh-my-zsh

# Copy/configure p10k
ln -s $CWD/.oh-my-zsh/custom/themes/powerlevel10k $HOME/.oh-my-zsh/themes/

# Copy/configure vundle - has to be symlink for plugin install
ln -s $CWD/bundle $HOME/.vim/

# Install and configure Vundle options
vim ~/.vimrc +PluginInstall +x +q!
