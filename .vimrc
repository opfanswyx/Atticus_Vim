"""""""""""basic seting""""""""""
set nu              " 显示行号
syntax on           " 自动语法高亮
set nocompatible    " 不兼容vi模式
set history=1000    " 设置历史记录步数
set autoread        " 当文件在外部被修改时，自动更新该文件
set showmatch       " 高亮显示匹配的括号([{和}])
set matchtime=1
set ruler           " 设置标尺
filetype on         " 检测文件类型
set mouse=a         " 激活鼠标使用
set tabstop=4       " 设置tab缩进
set shiftwidth=4    " 设置<<和>>命令移动时的宽度
set autoindent      " 自动缩进
set autoread        " 自动读取
set autowrite       " 自动保存
set autochdir       " 可打开目录
set nocp            
set cursorline      " 游标
set cursorcolumn    " 游标
set incsearch       " 显示匹配结果
set hlsearch        " 并高亮所有结果
set ignorecase      " 搜索时忽略大小写
set smartcase
set showcmd
set cmdheight=1

au FileType c,cpp,python,vim set textwidth=80
set colorcolumn=81

au FileType text,markdown,html,xml set wrap
set linebreak       " 折行时，以单词为界，以免切断单词
set breakindent     " 折行后的后续行，使用与第一行相同的缩进

" 不同平台，设置不同的行尾符，即 EOL
" 注意：在 Mac 平台，也是 unix 优先；自 OS X 始，行尾符与 Unix 一致，
"      都是 `\n` 而不是 `\r`
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif

""""""""""""space"""""""""""""""
noremap <leader>m :%s/<C-V><C-M>//ge<CR>  " 移除 Windows 文件结尾的 `^M`
" 这个函数通过替换命令删除行尾空格
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc

" 保存时自动删除行尾空格
au BufWrite * :call DeleteTrailingWS()
map <leader>W :call DeleteTrailingWS()<CR>

"""""""""""编码设置""""""""""""""
set encoding=utf-8          "设置编码"
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8     "设置文件编码"
set termencoding=utf-8      "设置终端编码"
set langmenu=zh_CN.UTF-8    "设置语言编码"
set helplang=cn             "帮助语言"

"""""""""""括号匹配""""""""""""""""
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
"inoremap { {}<esc>i
"inoremap < <><esc>i

""""""""""""""""""""""""""author info""""""""""""""""""""
"新建.py,.cc,.sh,.cpp,.c文件，自动插入文件头"
autocmd BufNewFile *.py,*.cc,*.sh,*.cpp,*.c exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头"
func SetTitle()
    "if expand ("%:e") == 'c'
        call setline(1, "/***********************************************")
        call setline(2, "*Author:       Atticus")
        call setline(3, "*Blog:         https://opfanswyx.top")
        call setline(4, "*Time:         ".strftime("%F %T"))
        call setline(5, "*Name:         ".expand("%"))
        call setline(6, "*Version:      V1.0")
        call setline(7, "*Description:  This is a production script.")
        call setline(8, "***********************************************/")
    "endif
endfunc


"""""""""""""""""""""""vim-plug""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'                  " 目录
Plug 'octol/vim-cpp-enhanced-highlight'     " cpp语法高亮
Plug 'vim-airline/vim-airline'              " 状态栏
Plug 'Yggdroot/indentLine'                  " 缩进线
Plug 'Raimondi/delimitMate'                 " 括号补全
"Plug 'universal-ctags/ctags'
"Plug 'dense-analysis/ale'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'ludovicchabant/vim-gutentags'
"""""""theme""""""""
"Plug 'altercation/vim-colors-solarized'     " 主题
Plug 'morhetz/gruvbox'
"Plug 'ayu-theme/ayu-vim'
"Plug 'drewtempelmeyer/palenight.vim' " 基于 Onedark，效果差不多
"Plug 'joshdick/onedark.vim' " Atom Onedark 的复刻
call plug#end()

""""""""""""""""NERDTree"""""""""""""""
"ctrl+w+w，光标自动在左右侧窗口切换
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowLineNumbers=1         " 窗口是否显示行号
let g:NERDTreeHidden=1                  " 不显示隐藏文件
let g:NERDTreeDirArrowExpandable = '+'  " 修改树的显示图标
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos='left'             " 窗口位置
let g:NERDTreeSize=30                   " 窗口尺寸
                                        " 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""indentLine"""""""""""""""""""
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

""""""""""""""delimitMate"""""""""""""""
au FileType python let b:delimitMate_nesting_quotes = ['"']

""""""""""""""theme""""""""""""""
colorscheme gruvbox
set background=dark
"set background=light
"colorscheme solarized