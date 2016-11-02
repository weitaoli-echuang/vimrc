set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"配色方案
syntax enable
set t_Co=256
"colorscheme darkblue
colorscheme myColor
set background=dark
"colorscheme solarized
"隐藏工具栏和菜单栏
"set guioptions-=m
set guioptions-=T

"
"折叠
"set foldmethod=indent

"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set guifont=YaHei\ Consolas\ Hybrid:h14
"set gfw=@YaHei\ Consolas\ Hybrid:h14

"set helplang=cn
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"禁止生成临时文件
set nobackup

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
"set incsearch
"搜素时高亮显示被找到的文本
"set hlsearch

" 设定 << 和 >> 命令移动时的宽度为 4
"set ts=4 sw=4 noet
set shiftwidth=4
set smarttab
set history=1024
set expandtab

set list
set listchars=tab:\ \ ,trail:$


"行内替换
set gdefault

"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
set cursorline

"自动缩进
set autoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"字符宽度
set textwidth=120  

"输入法设置
if has('multi_byte_ime')
"未开启IME时光标背景色
hi Cursor guifg=bg guibg=Orange gui=NONE
"开启IME时光标背景色
hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
" 关闭Vim的自动切换IME输入法(插入模式和检索模式)
set iminsert=0 imsearch=0
" 插入模式输入法状态未被记录时，默认关闭IME
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"与Windows共享剪贴板
set clipboard+=unnamed

"编辑vimrc之后，重新加载
autocmd! bufwritepost _vimrc source $VIM/_vimrc

"##########插件管理 开始#############
"更多插件见： http://vim-scripts.org/vim/scripts.html
filetype on
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"插件管理核心库
Bundle 'gmarik/vundle'

"高级语法高亮c++
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'beyondmarc/opengl.vim'
"opengl 语法高亮
Bundle	'tikhomirov/vim-glsl'

"实现源代码结构和函数列表展示
Bundle 'taglist.vim'
map <F3> :silent! Tlist<CR>


"注释插件
Bundle 'The-NERD-Commenter'
"由注释生成文档，并且能够快速生成函数标准注释
Bundle 'DoxygenToolkit.vim'
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="Weitao Li"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30



" build tags of your own project with CTRL+F12
set tags=tags;
" tags目录
set tags+=$VIM/vimfiles/tags/cpp
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"文件管理器
Bundle 'The-NERD-tree'
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
"A-t : 打开NERDTree
map <silent> <C-t> <ESC>:NERDTree<CR>
" 以打开NERDTree时的目录为工作目录
let NERDTreeChDirMode=1

"实现cpp和h文件快速切换
Bundle 'a.vim'


"实现C/C++语言自动补全
Bundle 'OmniCppComplete'
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


"代码补全
Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'honza/vim-snippets'
let g:neosnippet#snippets_directory=$VIMFILES.'/bundle/vim-snippets/snippets'
let g:snips_author='Weitao Li'
let g:snips_email='weitaoli@gmail.com'
let g:snips_github=' '

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'Tabular'
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

"statuslines 增强
Bundle 'scrooloose/vim-statline'

"python diction
Bundle 'rkulla/pydiction'
let g:pydiction_location = $VIMFILES.'/bundle/pydiction/complete-dict'
Bundle 'scrooloose/syntastic'

"激活插件与文件类型的依赖关系
filetype plugin indent on " required!
"##########插件管理 结束#############


" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

autocmd FileType python setlocal noexpandtab omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


au BufNewFile,BufRead *.cu,*.cuh set ft=cpp
autocmd BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs set filetype=glsl

Bundle 'scons.vim'
autocmd BufNewFile,BufRead SCons* set filetype=scons
source $VIMRUNTIME/macros/matchit.vim
filetype indent on
autocmd BufEnter *.m compiler mlint



autocmd GUIEnter * simalt ~x
