
"__   __        _                             _   ______
"\ \ / /       | |                           | |  | ___ \
" \ V /__ _  __| |_   _ _ __   __ _ _ __   __| |  | |_/ / __ ___ _ __ ___
"  \ // _` |/ _` | | | | '_ \ / _` | '_ \ / _` |  |  __/ '__/ _ \ '_ ` _ \
"  | | (_| | (_| | |_| | | | | (_| | | | | (_| |  | |  | | |  __/ | | | | |
"  \_/\__,_|\__,_|\__,_|_| |_|\__,_|_| |_|\__,_|  \_|  |_|  \___|_| |_| |_|

"--------------------------------------------------------------------------------
"------------------------Neovim Configuration-------------------------
"--------------------------------------------------------------------------------
"
"Sets line number and relative line number
set number
set relativenumber
"Changes tabs to spaces
set expandtab
set tabstop=4
set shiftwidth=4

"Golang file settings
au FileType go setlocal tabstop=4
au FileType go setlocal shiftwidth=4
au FileType go setlocal noexpandtab

"--------------------------------------------------------------------------------
"------------------------------------Plugins-------------------------------------
"--------------------------------------------------------------------------------
if &compatible
  set nocompatible
endif

"Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

"Required:
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  "Let dein manage dein
  "Required:
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  "Add or remove your plugins here:
  "Autocompletion
  call dein#add('Shougo/deoplete.nvim')

  "Golang autcompletion
  call dein#add('fatih/vim-go')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  "TreeView
  call dein#add('scrooloose/nerdtree')
  "Vim powerline
  call dein#add('vim-airline/vim-airline')
  "Vim powerline Theme
  call dein#add('vim-airline/vim-airline-themes')
  "Fuzzy File Finding
  call dein#add('Shougo/denite.nvim')
  "Snippets
  call dein#add('SirVer/ultisnips')
  "Rails
  call dein#add('tpope/vim-rails')
  "C-Lang Completion
  call dein#add('zchee/deoplete-clang')
  "C-Lang support
  call dein#add('WolfgangMehner/c-support')
  "Python support
  call dein#add('zchee/deoplete-jedi')


  "Required:
  call dein#end()
  call dein#save_state()
endif

"Required:
filetype plugin indent on
syntax enable

"If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable


"--------------------------------------------------------------------------------
"---------------------------------Plugin Config----------------------------------
"--------------------------------------------------------------------------------
"Deoplete
let g:deoplete#enable_at_startup = 1
"Deoplete-Clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"Sets gocode binary
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

"Go auto imports
let g:go_fmt_command="goimports"

"Powerline Theme to use
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_default'
let g:airline_solarized_bg='dark'

"Shows all buffers
let g:airline#extensions#tabline#enabled = 1




"--------------------------------------------------------------------------------
"-----------------------------------Key Binds------------------------------------
"--------------------------------------------------------------------------------
"Sets leader key to space
let mapleader = "\<Space>"
"maps semi-colon(;) to colon(:)
nnoremap ; :
"Removes trailing whitepace on F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"Go to next buffer
nnoremap <C-n> :bnext<CR>
"Go to previous buffer
nnoremap <C-b> :bprevious<CR>
"Close current buffer
nnoremap <C-v> :bdelete<CR>
"Escape Insert Mode
imap jk <Esc>
"create vertical split
nnoremap <Leader>\ :vsp<CR>
"Create Horizontal Split
nnoremap <Leader>- :sp<CR>
"Move left
nnoremap <C-h> <C-w>h
"Move down
nnoremap <C-j> <C-w>j
"Move up
nnoremap <C-k> <C-w>k
"Move right
nnoremap <C-l> <C-w>l

"Open up Denite and search in folder
nnoremap <Leader>pf :Denite file_rec <CR>
nnoremap <C-p> :Denite file_rec <CR>
"Open up Denite and search in buffer
nnoremap <Leader>pb :Denite buffer <CR>

"Open NerdTree
nnoremap <Leader>t :NERDTreeToggle <CR>

"Write file
nnoremap <Leader>w :w<CR>
"Quit File
nnoremap <Leader>q :q<CR>

"Normal Mode paste from register
nmap <Leader>p "+p
nmap <Leader>P "+P

"Visual Mode save to register
vmap <Leader>y "+y
"Visual mode paste from register
vmap <Leader>p "+p

"Tab completion for deoplete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:UltiSnipsExpandTrigger="<C-s>"

"Go Specific
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
