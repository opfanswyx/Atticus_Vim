"""""""""""""""""basic seting"""""""""""""""""""
set nu              " 显示行号
set relativenumber  " 相对行号
syntax on           " 自动语法高亮
filetype on         " 检测文件类型
set nocompatible    " 关闭兼容模式(不兼容vi模式)，最大限度使用新特性
set history=1000    " 设置历史记录步数
set autoread        " 当文件在外部被修改时，自动更新该文件
set autowrite       " 自动保存
set autochdir       " 可打开目录
set showmatch       " 高亮显示匹配的括号([{和}])
set matchtime=1     " 高亮时长
set ruler           " 设置标尺
set mouse=a         " 激活鼠标使用
set tabstop=4       " 设置tab缩进
set shiftwidth=4    " 设置<<和>>命令移动时的宽度
set autoindent      " 自动缩进
set smartindent     " 智能缩进
set cursorline      " 游标突出显示当前行
set cursorcolumn    " 游标突出显示当前列

set incsearch       " 显示匹配结果
set hlsearch        " 并高亮所有结果
set ignorecase      " 搜索时忽略大小写
set smartcase       " 输入任何大写字母严格匹配大小写，只输入小写则开启ignorecase

set showcmd         " 显示指令输入
set cmdheight=2     " 指令输入行高
set showmode        " 显示vim模式
set scrolloff=7     " 光标上下行保留行数
set paste           " 设置粘贴模式

"""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示空格和tab
set list listchars=tab:→\ ,trail:·

" 设置以下文本宽度80列，第81列高亮
au FileType c,cpp,python,vim set textwidth=80
set colorcolumn=81

" 设置以下文本折行
au FileType text,markdown,html,xml set wrap
set linebreak       " 折行时，以单词为界，以免切断单词
set breakindent     " 折行后的后续行，使用与第一行相同的缩进

" 不同平台，设置不同的行尾符，即 EOL
" 注意：在 Mac 平台，也是 unix 优先；自 OS X 始，行尾符与 Unix 一致，
" 都是 `\n` 而不是 `\r`
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif

" 移除 Windows 文件结尾的 `^M`
noremap <leader>m :%s/<C-V><C-M>//ge<CR>  

"""""""""""""""""""""编码设置""""""""""""""""""""""""
set encoding=utf-8          "设置编码"
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8     "设置文件编码"
set termencoding=utf-8      "设置终端编码"
set langmenu=zh_CN.UTF-8    "设置语言编码"
set helplang=cn             "帮助语言"

"--------------------------------------------------"
"""""""""""""""""""""vim-plug"""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'                  " 文件管理器，目录
Plug 'octol/vim-cpp-enhanced-highlight'     " cpp语法高亮
Plug 'vim-airline/vim-airline'              " 状态栏
Plug 'Raimondi/delimitMate'                 " 括号补全
"Plug 'universal-ctags/ctags'               " universal-ctags
"Plug 'majutsushi/tagbar'                   " 代码提纲             
"Plug 'dense-analysis/ale'                  " 代码检测
"Plug 'ycm-core/YouCompleteMe'              " 补全
"Plug 'ludovicchabant/vim-gutentags'        " 自动生成ctags
"--------theme--------"
"Plug 'altercation/vim-colors-solarized'    " solarized主题
Plug 'morhetz/gruvbox'                      " gruvbox
call plug#end()

""""""""""""""""""NERDTree文件管理器"""""""""""""""""
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

"""""""""""""""""delimitMate括号补全"""""""""""""""""
au FileType python let b:delimitMate_nesting_quotes = ['"']

""""""""""""""""""theme主题设置""""""""""""""""""""""
colorscheme gruvbox
set background=dark
"set background=light
"colorscheme solarized