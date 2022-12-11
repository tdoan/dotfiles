" This is Tony Doan's .vimrc file
" 
set nocompatible
filetype off
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('jlanzarotta/bufexplorer')
call minpac#add('scrooloose/nerdtree')
call minpac#add('rust-lang/rust.vim')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('racer-rust/vim-racer')
call minpac#add('cespare/vim-toml')
call minpac#add('Valloric/YouCompleteMe')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('machakann/vim-highlightedyank')

"call minpac#add('prabirshrestha/async.vim')
"call minpac#add('prabirshrestha/vim-lsp')
"call minpac#add('prabirshrestha/asyncomplete.vim')
"call minpac#add('prabirshrestha/asyncomplete-lsp.vim')

call minpac#add('w0rp/ale')
call minpac#add('godlygeek/tabular')
call minpac#add('plasticboy/vim-markdown')

filetype plugin indent on

""""""""""""""""""""""""""""""""""
" Basic editing
""""""""""""""""""""""""""""""""""
set hidden
" remember more commands and search history
set history=10000
set ts=2 sts=2 sw=2 expandtab
set autoindent
set laststatus=2
set mouse=
"""""""""""""""""""""""""""""""""""
" Search options
"""""""""""""""""""""""""""""""""""
set showmatch
set hlsearch
nnoremap <leader><CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>
"insentive search unless there are uppercase letter in the search
set ignorecase smartcase
"incremental sarch
set incsearch
" don't highlight current line
set nocursorline
set cmdheight=2
set switchbuf=useopen
set scrolloff=3

set backup
set backupdir=~/tmp/.vim,/var/tmp,/tmp
set directory=~/tmp/.vim,/var/tmp,/tmp

set diffopt=vertical,filler,iwhite

syntax enable
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

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
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59
"set list

filetype on
filetype indent on
filetype plugin on

runtime macros/matchit.vim

compile ruby
"show line number
set nu
" show column number
set ruler
"
"Auto source .vimrc
"if has("autocmd")
"autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <UP> <C-W>-
nnoremap <silent> <DOWN> <C-W>+
nnoremap <silent> <LEFT> <C-W>>
nnoremap <silent> <RIGHT> <C-W><


let g:netrw_preview   = 0
let g:netrw_liststyle = 3
let g:netrw_winsize   = 15

let g:ctrlp_custom_ignore = {
	\ 'dir':  '\vvendor$',
	\ }
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>. :NERDTree %:p:h<CR>
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
set splitright
" autocmd vimenter * if !argc() | NERDTree | endif

nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

set foldlevelstart=20
nmap <leader>f :set foldmethod=syntax<CR>
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.fountain set filetype=fountain

" xmpfilter the full buffer
" nmap  ,r mzggVG!xmpfilter -a --no-warnings<cr>`z
"nmap  ,rr mzggVG!seeing_is_believing<cr>`z
"nmap  ,rc mzggVG!seeing_is_believing --clean<cr>`z
"nmap  ,rx mzggVG!seeing_is_believing --xmpfilter-style<cr>`z
"imap  ,rr <ESC>,rr
"imap  ,rc <ESC>,rc
"imap  ,rx <ESC>,rx

" css autocomplete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS

" vim-seeing-is-believing
nmap <leader>r <Plug>(seeing-is-believing-run)
"xmap ,r <Plug>(seeing-is-believing-run)
"imap ,r <Plug>(seeing-is-believing-run)

nmap <leader>m <Plug>(seeing-is-believing-mark)
"xmap ,m <Plug>(seeing-is-believing-mark)
"imap ,m <Plug>(seeing-is-believing-mark)

" random
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
nnoremap <leader>d :<C-U>call DiffToggle()<CR>
function! DiffToggle()
  if &diff 
    windo diffoff
  else
    windo diffthis
  endif
endfunction

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

let g:racer_cmd = "/Users/tdoan/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

let g:racer_cmd = "/Users/tdoan/.cargo/bin/racer"
let g:ycm_rust_src_path="/Users/tdoan/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/"

"let g:ale_rust_cargo_check = 1
