source ~/.ghost/ghost.vim/nerdtree.vimrc
source ~/.ghost/ghost.vim/cursor.vimrc
source ~/.ghost/ghost.vim/autosave.vimrc
source ~/.ghost/ghost.vim/clipboard.vimrc

set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set visualbell
set t_vb=
set encoding=utf8
set nu
colorscheme alduin
hi Normal guibg=NONE ctermbg=NONE


imap jj <Esc>
map <F8> :w<cr>
map <F10> :wqall<cr>
map <F9> :w<cr>:! python3 %<cr>
map <F7> :w<cr>:! python3 main.py<cr>
imap <F7> <Esc><F7>
map gc :GitCommit 
map gch :GitCheckout 
map gb :GitBranch 
map gc :! git add . && git commit -m '
map gb :! git checkout -b 
map R ggdGi<C-v><Esc>

autocmd VimEnter * NERDTree | wincmd p

:com Code cr /mnt/c/Users/huncho/code
:com Vim e ~/.vimrc
:com Gvim e ~/.ghost/ghost.vimrc
:com Vundle e ~/.vim/vundle.vimrc
:com Gs cd /mnt/c/Users/huncho/code/ghostsystems
:com Fb cd /mnt/c/Users/huncho/code/ghostsystems/flyingbytes
:com Bash e ~/.bashrc
:com Gbash e ~/.ghost/ghost.sh
