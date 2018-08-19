execute pathogen#infect()
syntax on
filetype plugin indent on

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
set mouse=a

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
