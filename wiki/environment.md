S X 10.7.3, 10.8

1. bash:   .bash_profile
2. xcode:
3. brew:
4. git:    .gitconfig
5. vim:    .vimrc
  1. vundle
6. rvm:    (.rvmrc)
7. tmux:   .tmux.conf
  1. tmux-MacOSX-pasteboard

### bash
    git clone https://github.com/usutani/dotfiles.git

    ln -s ~/dotfiles/_bash_profile ~/.bash_profile
    ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/_vimrc ~/.vimrc

### (Subversion)

    brew install subversion --unicode-path

~/.subversion/config

    ### Set log-encoding to the default encoding for log messages
    log-encoding = UTF-8-mac

## Ubuntu Server 10.4 LTS

### bash
    ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/_vimrc ~/.vimrc

### Git
    sudo apt-get install git-core git-doc
http://help.github.com/linux-set-up-git/

### Vundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

### tmux
    sudo apt-get install build-essential
    sudo apt-get install libevent-dev libncurses5-dev
    
    wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.6/tmux-1.6.tar.gz
    tar -zxvf tmux-1.6.tar.gz
    cd tmux-1.6
    ./configure
    make
    sudo make install

#### .bashrc
    alias g='git'

## Common

### Git
    git config --global color.ui auto
    
    git config --global core.editor vim
    
    git config --global alias.st status
    git config --global alias.br branch
    git config --global alias.co checkout
    git config --global alias.ci commit
    git config --global alias.l 'log --color --graph --pretty=oneline --decorate --date=short --abbrev-commit --branches'
    git config --global alias.ds 'diff --stat'
    
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global difftool.prompt false
    git config --global alias.dt difftool
    git config --global alias.mt mergetool

