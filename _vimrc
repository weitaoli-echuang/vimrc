set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"��ɫ����
syntax enable
set t_Co=256
"colorscheme darkblue
colorscheme myColor
set background=dark
"colorscheme solarized
"���ع������Ͳ˵���
"set guioptions-=m
set guioptions-=T

"
"�۵�
"set foldmethod=indent

"���ù���Ŀ¼Ϊ��ǰ�༭�ļ���Ŀ¼
set bsdir=buffer
set autochdir
"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"��������
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set guifont=YaHei\ Consolas\ Hybrid:h14
"set gfw=@YaHei\ Consolas\ Hybrid:h14

"set helplang=cn
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"��ֹ������ʱ�ļ�
set nobackup

"�������Դ�Сд
set ignorecase

"�������ַ�����
"set incsearch
"����ʱ������ʾ���ҵ����ı�
"set hlsearch

" �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4
"set ts=4 sw=4 noet
set shiftwidth=4
set smarttab
set history=1024
set expandtab

set list
set listchars=tab:\ \ ,trail:$


"�����滻
set gdefault

"ʼ����ʾ�к�
set number

"��ʾ��������
set ruler

"��������
set cursorline

"�Զ�����
set autoindent
set cindent
set smartindent

"Tab���Ŀ��
set shiftwidth=4
set tabstop=4

"�ַ����
set textwidth=120  

"���뷨����
if has('multi_byte_ime')
"δ����IMEʱ��걳��ɫ
hi Cursor guifg=bg guibg=Orange gui=NONE
"����IMEʱ��걳��ɫ
hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
" �ر�Vim���Զ��л�IME���뷨(����ģʽ�ͼ���ģʽ)
set iminsert=0 imsearch=0
" ����ģʽ���뷨״̬δ����¼ʱ��Ĭ�Ϲر�IME
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"��Windows���������
set clipboard+=unnamed

"�༭vimrc֮�����¼���
autocmd! bufwritepost _vimrc source $VIM/_vimrc

"##########������� ��ʼ#############
"���������� http://vim-scripts.org/vim/scripts.html
filetype on
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"���������Ŀ�
Bundle 'gmarik/vundle'

"�߼��﷨����c++
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'beyondmarc/opengl.vim'
"opengl �﷨����
Bundle	'tikhomirov/vim-glsl'

"ʵ��Դ����ṹ�ͺ����б�չʾ
Bundle 'taglist.vim'
map <F3> :silent! Tlist<CR>


"ע�Ͳ��
Bundle 'The-NERD-Commenter'
"��ע�������ĵ��������ܹ��������ɺ�����׼ע��
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
" tagsĿ¼
set tags+=$VIM/vimfiles/tags/cpp
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"�ļ�������
Bundle 'The-NERD-tree'
" ��Tree���Լ���װ�εö��˶��Ư����
let NERDChristmasTree=1
" ���Ƶ�����ƶ�����һ������ʱ���Ƿ��Զ������������������
let NERDTreeAutoCenter=1
" ָ�����ģʽ(1.˫���� 2.��Ŀ¼˫�ļ� 3.������)
let NERDTreeMouseMode=2
" �Ƿ�Ĭ����ʾ��ǩ�б�
let NERDTreeShowBookmarks=1
" �Ƿ�Ĭ����ʾ�ļ�
let NERDTreeShowFiles=1
" �Ƿ�Ĭ����ʾ�к�
let NERDTreeShowLineNumbers=0
" ����λ�ã�'left' or 'right'��
let NERDTreeWinPos='left'
" ���ڿ��
let NERDTreeWinSize=31
"A-t : ��NERDTree
map <silent> <C-t> <ESC>:NERDTree<CR>
" �Դ�NERDTreeʱ��Ŀ¼Ϊ����Ŀ¼
let NERDTreeChDirMode=1

"ʵ��cpp��h�ļ������л�
Bundle 'a.vim'


"ʵ��C/C++�����Զ���ȫ
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


"���벹ȫ
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

"statuslines ��ǿ
Bundle 'scrooloose/vim-statline'

"python diction
Bundle 'rkulla/pydiction'
let g:pydiction_location = $VIMFILES.'/bundle/pydiction/complete-dict'
Bundle 'scrooloose/syntastic'

"���������ļ����͵�������ϵ
filetype plugin indent on " required!
"##########������� ����#############


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
