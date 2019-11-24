## 插件管理[vim-plug](https://github.com/junegunn/vim-plug)

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### `~/.vimrc`

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
