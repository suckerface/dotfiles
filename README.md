# dotfiles configuration installer

This repo houses dotfiles for my zsh UI. Running `install.sh` will check for previous instances of the associated files, back them up (.\<file\>.bak) and symlink the files from the repo to the appropriate location.

### Features
+ oh-my-zsh UI
+ Powerlevel 10k theme
+ Tmux at launch
+ Custom stat bar
    + Music currently playing in the Apple Music app (using .applemusic script)
    + Battery percentage (using battery.sh)
    + Date/time
    + Hostname

** Coming Soon **
+ [x] IP address in stat bar
+ [ ] Performance stats (CPU/Memory)
+ [ ] Configurable stock ticker
+ [ ] Weather


### Screenshots

![VIM UI](https://github.com/suckerface/dotfiles/blob/master/images/vim.png)

![TMUX UI](https://github.com/suckerface/dotfiles/blob/master/images/ui.png)
