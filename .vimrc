" This is Tony Doan's .vimrc file
" 
"
call pathogen#infect()
""""""""""""""""""""""""""""""""""
" Basic editing
""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
" remember more commands and search history
set history=10000
set ts=2 sts=2 sw=2 expandtab
set autoindent
set laststatus=2
"""""""""""""""""""""""""""""""""""
" Search options
"""""""""""""""""""""""""""""""""""
set showmatch
set hlsearch
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>
"insentive search unless there are uppercase letter in the search
set ignorecase smartcase
"incremental sarch
set incsearch
" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set scrolloff=3

set backup
set backupdir=~/tmp/.vim,/var/tmp,/tmp
set directory=~/tmp/.vim,/var/tmp,/tmp

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
"shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"set list

syntax on
filetype on
filetype indent on
filetype plugin on

runtime macros/matchit.vim

compile ruby
"show line numbers
set nu
"
"Auto source .vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


let g:netrw_preview   = 0
let g:netrw_liststyle = 3
let g:netrw_winsize   = 15

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>. :NERDTree %:p:h<CR>
let NERDTreeChDirMode=2
set splitright

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

set foldlevelstart=20
nmap <leader>f :set foldmethod=syntax<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.fountain set filetype=fountain
