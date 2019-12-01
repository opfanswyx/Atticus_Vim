>以下内容需要vim8，请先确保vim版本符合。

>vim哲学:keep it simple

>[vim在线中文文档](http://vimcdoc.sourceforge.net/doc/help.html)

## 插件管理[vim-plug](https://github.com/junegunn/vim-plug)

安装命令:
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### `~/.vimrc`示例

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
### Commands

|Command|Description|
|:-|:-|
| `PlugInstall [name ...] [#threads]` | Install plugins|
| `PlugUpdate [name ...] [#threads]`  | Install or update plugins|
| `PlugClean[!]`| Remove unlisted plugins (bang version will clean without prompt) |
| `PlugUpgrade` | Upgrade vim-plug itself|
| `PlugStatus` | Check the status of plugins|
| `PlugDiff`| Examine changes from the previous update and the pending changes|
| `PlugSnapshot[!] [output path]`| Generate script for restoring the current snapshot of the plugins  |

## vimrc基本配置说明
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

## [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)

YouCompleteMe 简称 YCM，是一款 Vim 下非常流行的自动代码补齐神器。

## [universal-ctags]()