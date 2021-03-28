#!/bin/zsh

# This script will symlink dotfiles from the git repo directory to their appropriate locations in the user's home directory

RED='\033[0;31m'
NC='\033[0m'

# sets CWD variable to current directory
CWD=$(pwd)

# The next line is needed to automatically pull submodules included in the repo
git submodule update --init --recursive

# Symlinks files from repo to home directories
ln -is $CWD/.applemusic $HOME
ln -is $CWD/.battery.sh $HOME
ln -is $CWD/.p10k.zsh $HOME
ln -is $CWD/.tmux.conf $HOME
ln -is $CWD/.vimrc $HOME
ln -is $CWD/.zshrc $HOME

echo "If your prompt has unknown characters, run ${RED}'p10k configure'${NC} and answer ${RED}'Y'${NC} at the prompt to install the Meslo Nerd Font"

# ln -is $CWD/.oh-my-zsh $HOME/.oh-my-zsh
