"system level init
function! TVIM_pre_init()
endfunction

"Add you extra config here
function! TVIM_user_init()
"set nonu
"set nornu
"colorscheme jellybeans
"set guifont=
"set guifontwide=
endfunction

"Add you extra favorite plugin here
function! TVIM_plug_init()
"Plug 'someone/something'
" 可视化缩进
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/ctags.vim'
" 静态代码分析
Plug 'scrooloose/syntastic'
" 文件搜索
Plug 'kien/ctrlp.vim'
" 目录树导航
Plug 'scrooloose/nerdtree'
" 美化状态栏
Plug 'Lokaltog/vim-powerline'
" 主题风格
Plug 'altercation/vim-colors-solarized'
" python自动补全
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
" 括号匹配高亮
Plug 'kien/rainbow_parentheses.vim'
" 可视化缩进
Plug 'nathanaelkane/vim-indent-guides'
endfunction