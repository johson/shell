""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set listchars=tab:\ | \ ,trail:.,extends:>,precedes:<   "缩进线 会对tab进行缩进的，以“|”显示，
"set list lcs=tab:\|\

"set background=dark      "背景使用黑色 
"colorscheme solarized    " 设置背景主题  
syntax on           " 语法高亮  
"set cursorcolumn " 突出显示当前列
set cursorline " 突出显示当前行
set cmdheight=2     " 命令行（在状态行下）的高度，设置为2
set whichwrap=h,l   " 允许backspace和光标键跨越行边界(不建议) 就是左边到底了就到了上一行的右边 
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
"set novisualbell    " 不要闪烁(不明白)  

"状态行显示的内容  
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
"hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=%{CurDir()}\ \>\ %f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ %{strftime(\"%Y/%m/%d\-\%H:%M\")}%=[行=%l/%L,列=%v][%p%%]
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set showcmd         " 在状态栏显示正在输入的命令 输入的命令显示出来，看的清楚些  



" 设置在状态行显示的信息
set foldcolumn=1
set foldmethod=indent 
set foldlevel=3 
set foldenable      " 开始折叠
set foldenable      " 允许折叠  

set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 显示行号
set number

" 设置 退出vim后，内容显示在终端屏幕
"set t_ti= t_te=

" 左下角显示当前vim模式
set showmode
" Go to home and end using capitalized directions
noremap <C-a>  ^
noremap <C-e>  $

" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"格式化代码
map <F12> gg=G
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <A-F2> :tabnew<CR>  
"列出当前目录文件  
map <F3> :tabnew .<CR>  
" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
map <F1> <Esc>
set nopaste "默认非粘贴模式
set pt=<F10> "set pastetoggle=<F10> "粘贴模式，在插入模式下粘贴内容，不会有任何的变形
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"从不备份  
set nobackup
"自动保存
set autowrite
set magic                   " 设置魔术 正则表达式的玩意
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 龙爷说要用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
set ignorecase "搜索忽略大小写
set ignorecase smartcase "若含一个或一个以上大写字母则敏感大小写搜索
set hlsearch "搜索逐字符高亮
set incsearch "搜索时一边输入一边找一边显示
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
set report=0 " 通过使用: commands命令，告诉我们文件的哪一行被改变过,只要操作改动的行数大于0，则在左下角报告
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
"set matchtime=1
"形成配对的字符，用％跳到配对的另一端，缺省为 "(:),{:},[:]"
set mps+=<:>
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
" 启用鼠标
 set mouse=a
" Hide the mouse cursor while typing
" set mousehide
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key
" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
"NERDtee设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
"nnoremap f :NERDTreeToggle
map <F7> :NERDTreeToggle<CR>  
imap <F7> <ESC>:NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.sh,.php文件，自动插入文件头
autocmd BufNewFile *.sh,*.php exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: qiaoxin")
		call append(line(".")+2, "\# mail: qiaoxin@jiehun.com.cn")
		call append(line(".")+3, "\# Created Time: ".strftime("%Y/%m/%d %H:%m:%S"))
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "")
	endif
	if &filetype == 'php'
    call setline(1,"<?php")
    call append(line("."),"/**")
    call append(line(".")+1, "* Copyright (C) jiehun.com.cn ".strftime("%Y")." All rights reserved.")
    call append(line(".")+2, "*")
    call append(line(".")+3, "* @author     ：Johson(qiaoxin@jiehun.com.cn)")
    call append(line(".")+4, "* @date       ：".strftime("%Y/%m/%d %H:%m:%S"))
    call append(line(".")+5, "* @version    ：1.0")
    call append(line(".")+6, "* @brief      ：")
    call append(line(".")+7, "*/")
    call append(line(".")+8, "class ".expand("%:r"))
    call append(line(".")+9, "{")
    call append(line(".")+10, "")
    call append(line(".")+11, "}")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 

"inoremap就只在插入(insert)模式下生效
"vnoremap只在visual模式下生效
"nnoremap就在normal模式下(狂按esc后的模式)生效
