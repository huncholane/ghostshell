cp -r . ~/.ghost
cd ~
cp -r .ghost/ghost.vim .vim
echo 'source ~/.ghost/ghost.sh' >> .bashrc
cp .vimrc /tmp/.vimrc && echo 'source ~/.ghost/ghost.vimrc' > .vimrc && cat /tmp/.vimrc >> .vimrc
mkdir -p .vim/pack/vendor/start
cd .vim/pack/vendor/start
git clone https://github.com/perservim/nerdtree
git clone https://github.com/ycm-core/YouCompleteMe
git clone https://github.com/rafi/awesome-vim-colorschemes
git clone https://github.com/davidhalter/jedi-vim
git clone https://github.com/ryanoasis/vim-divicons
cd YouCompleteMe
./install.py --all
