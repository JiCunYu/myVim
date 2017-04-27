vimrc-for-linux
===============

my vimrc for linux

HOW TO USE
----------

clone this repository

copy .vimrc and .vim to your home directory

    cp .vimrc ~/
    cp .vim ~/ -R

install [vundle](https://github.com/gmarik/vundle)

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

run vim, and type the following command to install all plugins:

    :BundleInstall
    
注意
--------
1、UCM（Valloric/YouCompleteMe）插件是自动补全插件，是编译性插件。

    cd ~/.vim/bundle/YouCompleteMe
    ./install --clang-completer
    
    
