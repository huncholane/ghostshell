cp -r . ~/.ghost
cd ~
cp -r .ghost/ghost.vim .vim
echo 'source ~/.ghost/ghost.sh' >> .bashrc
cp .vimrc /tmp/.vimrc && echo 'source ~/.ghost/ghost.vimrc' > .vimrc && cat /tmp/.vimrc >> .vimrc
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
