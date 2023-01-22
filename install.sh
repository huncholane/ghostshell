#!/bin/bash
touch ~/.bashrc
touch ~/.vimrc
if grep -q 'source ~/.ghost/ghost.sh' ~/.bashrc
then
    echo 'Bash is configured for ghostshell'
else 
    echo 'source ~/.ghost/ghost.sh' >> .bashrc
    echo 'Utilize ghost shell'
fi

if grep -q 'source ~/.ghost/ghost.vimrc' ~/.vimrc
then
    echo 'Vim is configured for ghostshell'
else
    cp .vimrc /tmp/.vimrc && echo 'source ~/.ghost/ghost.vimrc' > .vimrc && cat /tmp/.vimrc >> .vimrc
    echo 'Utilize ghost vim'
fi
echo

mkdir -p ~/.vim/pack/vendor/start
cd ~/.vim/pack/vendor/start

plug () {
    IFS='/' read -ra arr <<< $1
   if [ -d "${arr[1]}" ]; then
      echo "$1"' already exists'
   else
      git clone https://github.com/"$1"
   fi
} 

plug preservim/nerdtree
plug rafi/awesome-vim-colorschemes
plug davidhalter/jedi-vim
plug ryanoasis/vim-devicons
echo

