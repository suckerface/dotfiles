#!/bin/zsh

# This script will symlink dotfiles from the git repo directory to their appropriate locations in the user's home directory

RED='\033[0;31m'
NC='\033[0m'

# Variable declarations
# sets CWD variable to current directory
CWD=$(pwd)
P10K=~/.p10k.zsh
TMUX=~/.tmux.conf
VIM=~/.vimrc
ZSH=~/.zshrc
BATTERY=~/.battery.sh
MUSIC=~/.applemusic
OMZSH=~/.oh-my-zsh
dirP10K=~/.oh-my-zsh/custom/themes/powerlevel10k
VPN=~/.vpn.sh
LOCALIP=~/.localip.sh
FONT=/Library/Fonts

# Check for and install OMZSH if missing
if test ! -d "$OMZSH"; then
        echo "Installing Oh My Zsh \n"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        ln -is $CWD/.oh-my-zsh $HOME
fi

# The next line is needed to automatically pull submodules included in the repo
git submodule update --init --recursive

echo "Checking for and backing up existing config files"

if test -f "$P10K"; then
        echo "$P10k exists, creating backup"
        mv ~/.p10k.zsh ~/.p10k.zsh.bak
fi

if test -f "$TMUX"; then
        echo "$TMUX exists, creating backup"
        mv ~/.tmux.conf ~/.tmux.conf.bak
fi

if test -f "$VIM"; then
        echo "$VIM exists, creating backup"
        mv ~/.vimrc ~/.vimrc.bak
fi

if test -f "$ZSH"; then
        echo "$ZSH exists, creating backup"
        mv ~/.zshrc ~/.zshrc.bak
fi

if test -f "$BATTERY"; then
        echo "$BATTERY exists, creating backup"
        mv ~/.battery.sh ~/.battery.sh.bak
fi

if test -f "$MUSIC"; then
        echo "$MUSIC exists, creating backup"
        mv ~/.applemusic ~/.applemusic.bak
fi

if test -f "$VPN"; then
        echo "$VPN exists, creating backup"
        mv ~/.vpn.sh ~/.vpn.sh.bak
fi

if test -f "$LOCALIP"; then
        echo "$LOCALIP exists, creating backup"
        mv ~/.localip.sh ~/.localip.sh.bak
fi

echo "Creating symlinks"

# Symlinks files from repo to home directories
ln -is $CWD/.applemusic $HOME
ln -is $CWD/.battery.sh $HOME
ln -is $CWD/.p10k.zsh $HOME
ln -is $CWD/.tmux.conf $HOME
ln -is $CWD/.vimrc $HOME
ln -is $CWD/.zshrc $HOME
ln -is $CWD/.vpn.sh $HOME
ln -is $CWD/.localip.sh $HOME

echo "Adding Meslo Nerd Font"
if test ! -f "$FONT"/"MesloLGS NF Regular.ttf"; then
        ln -is "$CWD/fonts/MesloLGS NF Regular.ttf" $FONT
fi
if test ! -f "$FONT"/"MesloLGS NF Bold.ttf"; then
        ln -is $CWD/fonts/"MesloLGS NF Bold.ttf" $FONT
fi
if test ! -f "$FONT"/"MesloLGS NF Italic.ttf"; then
        ln -is $CWD/fonts/"MesloLGS NF Italic.ttf" $FONT
fi
if test ! -f $FONT/"MesloLGS NF Bold Italic.ttf"; then
        ln -is $CWD/fonts/"MesloLGS NF Bold Italic.ttf" $FONT
fi

echo "Adding Powerlevel10k theme"
if test ! -d "$dirP10K"; then
        sh -c "$(git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k)"
#        ln -is $CWD/.oh-my-zsh/custom/themes/powerlevel10k $HOME
fi

echo "Adding VIM plugins"
# Copy/configure vundle - has to be symlink for plugin install
if test ! -d "$VIM"; then
        mkdir $HOME/.vim
        ln -s $CWD/bundle $HOME/.vim
fi

# Install and configure Vundle options
vim ~/.vimrc +PluginInstall +x +q!

# Apply theme
source $HOME/.zshrc

echo "If your prompt has unkown characters, run ${RED}'p10k configure'${NC} and answer ${RED}'Y'${NC} at the prompt to install the Meslo Nerd Font"

echo "If an error regarding ${RED}'Can't locate local/lib.pm in @INC'${NC} appears, comment out or delete the last line in ~/.zshrc (${RED}'eval perl...'${NC})"
