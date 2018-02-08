"""""""""""basic seting""""""""""
set nu
syntax on
set nocompatible
filetype on
set history=1000
set autoindent
set tabstop=4
set shiftwidth=4
set showmatch
set matchtime=1
set guioptions-=T
set ruler
set incsearch
set wildmenu
set ignorecase
set autoread
set autowrite
set autochdir
set nocp
set mouse=a
set cursorline
set cursorcolumn

inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap < <><esc>i


"""""""""""TagList""""""""""""""""
let Tlist_Sort_Typle = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0

set tags=tags
let Tlist_Show_Menu = 1
let Tlist_Auto_Open = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1


""""""""""winmanager""""""""""""""
let g:AutoOpenWinManager=1
let g:winManagerWindowLayout='TagList|FileExplorer'
let g:winManagerWidth=30
let g:defalutExplorer=1
nmap <silent> <F2> :WMToggle<cr>






