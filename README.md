>以下内容需要vim8，请先确保vim版本符合。

>vim哲学:keep it simple

>[vim在线中文文档](http://vimcdoc.sourceforge.net/doc/help.html)

## vimrc无插件基本配置说明
```vim
set nu              " 显示行号
set relativenumber
syntax on           " 自动语法高亮
set nocompatible    " 不兼容vi模式
set history=1000    " 设置历史记录步数
set autoread        " 当文件在外部被修改时，自动更新该文件
set showmatch       " 高亮显示匹配的括号([{和}])
set matchtime=1     " 高亮时长
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
set t_Co=256        " 256色域

au FileType c,cpp,python,vim set textwidth=80
set colorcolumn=81

au FileType text,markdown,html,xml set wrap
set linebreak       " 折行时，以单词为界，以免切断单词
set breakindent     " 折行后的后续行，使用与第一行相同的缩进

"""""""""""编码设置"""""""""""""
set encoding=utf-8          "设置编码"
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8     "设置文件编码"
set termencoding=utf-8      "设置终端编码"
set langmenu=zh_CN.UTF-8    "设置语言编码"
set helplang=cn             "帮助语言"
```
## 插件管理器[vim-plug](https://github.com/junegunn/vim-plug)

安装命令:
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### `~/.vimrc`插件管理示例

```vim
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" 延迟按需加载，使用到命令的时候再加载或者打开对应文件类型才加载
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" 确定插件仓库中的分支或者 tag
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
call plug#end()
```
### 插件管理Commands

|Command|Description|
|:-|:-|
| `PlugInstall [name ...] [#threads]` | Install plugins|
| `PlugUpdate [name ...] [#threads]`  | Install or update plugins|
| `PlugClean[!]`| Remove unlisted plugins (bang version will clean without prompt) |
| `PlugUpgrade` | Upgrade vim-plug itself|
| `PlugStatus` | Check the status of plugins|
| `PlugDiff`| Examine changes from the previous update and the pending changes|
| `PlugSnapshot[!] [output path]`| Generate script for restoring the current snapshot of the plugins  |

## 常用插件
### [nerdtree]()文件管理器
#### 安装
```
vim-plug
```
#### vimrc配置
```
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
```
#### 使用命令
1. ctrl-n开启关闭

### [tagbar]()代码提纲
#### 安装
```
vim-plug安装
```
#### vimrc配置
```
""""""""""""""""""tagbar"""""""""""""""""""""""""""""
nmap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_sort = 0
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"""""""""""""""""""""""""""""""""""""""""""""""""""""
```
#### 使用命令
1. F9开启关闭

### [vim-cpp-enhanced-highlight]()cpp语法高亮
#### 安装
```
vim-plug
```
#### vimrc配置
#### 使用命令

### [vim-airline]()状态栏
#### 安装
```
vim-plug
```
#### vimrc配置
#### 使用命令


### [delimitMate]()括号补全
#### 安装
```
vim-plug
```
#### vimrc配置
```
"""""""""""""""""delimitMate括号补全"""""""""""""""""
au FileType python let b:delimitMate_nesting_quotes = ['"']
```
#### 使用命令

### [LeaderF](https://github.com/Yggdroot/LeaderF)
#### 安装
```
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
```
#### vimrc配置
#### 使用命令
http://www.manongjc.com/article/94716.html

### [universal-ctags]()ctags
#### 安装
```
git clone https://github.com/universal-ctags/ctags
cd ctags
./autogen.sh
./configure
make
sudo make install

sudo ln -s /usr/local/bin/ctags /usr/bin/ctags
```
#### vimrc配置
```
"""""""""""""""""universal-ctags"""""""""""""""""""""
"set tags=./.tags;,.tags
set autochdir
```
#### 使用命令
1. CTRL-] 跳转定义
2. CTRL-W] 新窗口预览
3. CTRL-O 返回之前的位置


### [vim-gutentags]()自动生成ctags
#### 安装
```
vim-plug
```
#### vimrc配置
vim-gutentags
```
let g:gutentags_project_root = ['.root','.svn','.git','.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS','--extra=+q','--c++-kinds=+px','--c-kinds=+px']
let g:gutentags_trace = 1
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
```
#### 使用命令


### []()

## vim主题
```
Plug 'altercation/vim-colors-solarized'    " solarized主题
Plug 'morhetz/gruvbox'                      " gruvbox
```
### vimrc配置
```
colorscheme gruvbox
set background=dark
"set background=light
"colorscheme solarized
```


## 参考链接
[如何在 Linux 下利用 Vim 搭建 C/C++ 开发环境? - 韦易笑的回答 - 知乎](https://www.zhihu.com/question/47691414/answer/373700711)