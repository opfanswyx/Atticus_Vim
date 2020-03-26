>以下内容需要vim8，请先确保vim版本符合。

>vim哲学:keep it simple

>[vim在线中文文档](http://vimcdoc.sourceforge.net/doc/help.html)

## vim常用技巧
1. i插入，在光标前插入
2. x删除当前光标所在的字符
3. dd删除并保持剪贴板，2dd删除2行
4. p黏贴 3p
5. hjkl左下右上
6. 数字0到行头
7. ^到本行第一个不是blank(空格，tab，换行，回车)字符
8. $到本行行尾
9. g_本行最后一个不是blank字符位置
10. /pattern 搜索出字符多个匹配，按n到下一个
11. yy拷贝当前行，相当于ddp
12. u撤销
13. <c-r>反撤销
14. .重复上一次命令 3.重复三次
14. NG到第N行 ：N如：137
15. gg到第一行
16. G到最后一行
17. 块操作hjkl =自动缩进<>左右缩进

## vimrc无插件基本配置说明
```vim
""""" 基础无插件设置
set nu              " 显示行号
set relativenumber  " 相对行号
syntax on           " 自动语法高亮
filetype on         " 检测文件类型
set nocompatible    " 关闭兼容模式,不兼容vi模式,最大限度使用新特性
set history=1000    " 设置历史记录步数
set autoread        " 当文件在外部被修改时，自动更新该文件
set autowrite       " 自动保存
set autochdir       " 可打开目录
set showmatch       " 高亮显示匹配的括号
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
set t_Co=256        " 256色域，某些vim不设置不会显示主题色彩

""""" 显示空格和tab
set list listchars=tab:→\ ,trail:·

""""" 设置以下文本宽度80列，第81列高亮
au FileType c,cpp,python,vim set textwidth=80
set colorcolumn=81

""""" 设置以下文本折行
au FileType text,markdown,html,xml set wrap
set linebreak       " 折行时，以单词为界，以免切断单词
set breakindent     " 折行后的后续行，使用与第一行相同的缩进

""""" 不同平台，设置不同的行尾符，即EOL
""""" 注意：在Mac平台，也是unix优先；自OS X始，行尾符与Unix一致，都是`\n`而不是`\r`
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif

""""" 移除Windows文件结尾的`^M`
noremap <leader>m :%s/<C-V><C-M>//ge<CR>  

""""" 编码设置
set encoding=utf-8          "设置编码"
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8     "设置文件编码"
set termencoding=utf-8      "设置终端编码"
set langmenu=zh_CN.UTF-8    "设置语言编码"
set helplang=cn             "帮助语言"

""""""""""""""""""""""""""""""""""""""""""""""""""""
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
1. ctrl-n开启关闭

### [tagbar]()代码提纲
1. F9开启关闭

### [vim-cpp-enhanced-highlight]()cpp语法高亮

### [vim-airline]()状态栏

### [delimitMate]()括号补全


### [LeaderF](https://github.com/Yggdroot/LeaderF)
#### 安装
```
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
```
#### vimrc配置
#### 使用命令
<leader>为"\"键

1. <leader>f 检索文件
2. <leader>b 检索buffer
3. ```LeaderMru```搜索最近使用过的文件
4. ```LeaderFunction```搜索当前文件的函数
5. ```LeaderLine```搜索当前文件中的某个单词

在leaderf运行起来后可执行如下操作
1. <ESC>退出leaderf
2. <c-r>模糊匹配与正则匹配切换
3. <c-f>在全路径搜索与名字搜索之间切换
4. <tab>在检索模式与选择模式切换

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
注意工程下需要有如下目录:
```'.root','.svn','.git','.project'```

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

[[Vim]插件之LeaderF](http://www.manongjc.com/article/94716.html)