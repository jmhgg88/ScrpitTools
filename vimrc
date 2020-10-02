"让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

execute pathogen#infect()
syntax on
filetype plugin indent on

"在光标所在位置处使用‘,+f’快捷键，查找所有文件中光标所在位置的字符串
" Set mapleader
let mapleader = ","
" for easy using sliver search
nmap <leader>c :norm yiw<CR>:cs find c <C-R>"<CR>
nmap <leader>d :norm yiw<CR>:cs find d <C-R>"<CR>
nmap <leader>e :norm yiw<CR>:cs find e <C-R>"<CR>
nmap <leader>f :norm yiw<CR>:cs find f <C-R>"<CR>
nmap <leader>g :norm yiw<CR>:cs find g <C-R>"<CR>
nmap <leader>i :norm yiw<CR>:cs find i <C-R>"<CR>
nmap <leader>s :norm yiw<CR>:cs find s <C-R>"<CR>
nmap <leader>t :norm yiw<CR>:cs find t <C-R>"<CR>
" Locate and return character "above" current cursor position.
function! LookUpwards()
    let column_num = virtcol('.')
    let target_pattern = '\%' . column_num . 'v.'
    let target_line_num = search(target_pattern . '*\S', 'bnW')
    if !target_line_num
        return ""
    else
        return matchstr(getline(target_line_num), target_pattern)
    endif
endfunction
imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>

"搜索高亮
set hlsearch

"语法高亮
syntax on

"显示行号
set number

"自动缩进与c语言风格缩进
set autoindent
set cindent

"缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4

"建议开启expandtag选项，会自动将tab扩展为空格，代码缩进会更美观
set expandtab
"set noexpandtab

"switch case 对齐风格
set cino=g0,:0

"设置色调dark，解决深色蓝色字体不容易看问题
set bg=dark

"开启所有模式的mouse支持
"set mouse=a

cs add ~/.cscope.out

"
"taglist
"
let Tlist_Show_One_File=1 "只显示当前文件的tags
let Tlist_WinWidth=40 "设置taglist宽度
let Tlist_Exit_OnlyWindow=1 "taglist窗口是最后一个窗口，则推出vim
let Tlist_Use_Right_Window=1 "在vim窗口右侧显示taglist窗口
let Tlist_Use_SingleClick=1 "缺省情况下，在双击一个tag时，才会跳出tag定义的位置
let Tlist_Auto_Open=1 "在启动VIM后，自动打开taglist窗口
let Tlist_File_Fold_Auto_Close=1 "同时显示多个文件的tag时，可使taglist只显示当前文件tag，其他文件的tag都被折叠起来

nnoremap <silent> <F8> :TlistToggle<CR>
set autochdir
set tag=./tags
