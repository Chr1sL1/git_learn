set nocompatible              " be iMproved, sssrequired
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Cpp11-Syntax-Support'
Plug 'vim-scripts/cSyntaxAfter'
Plug 'vim-scripts/Vimball'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/LeaderF'
Plug 'Shougo/echodoc.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


syntax enable
syntax on

"if has('termguicolors')
"	set termguicolors
"endif


set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nu
set autoindent
set cindent
set nocompatible
set cursorline
set laststatus=2
set hlsearch
set ic
set noshowmode
set t_Co=256

set guifont=Consolas:h10
set guioptions-=m
set guioptions-=T

inoremap jj <esc>
inoremap jk <esc>

autocmd GUIEnter * simalt ~x

set vb t_vb=
au GuiEnter * set t_vb=

"  Gvim中文菜单乱码解决方案

" 设置文件编码格式
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
if has("win32")
 set fileencoding=chinese
else
 set fileencoding=utf-8
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle提示信息输出乱码
"language messages zh_CN.utf-8

filetype plugin on
filetype indent on
highlight cursorline ctermbg=black guibg=NONE guifg=NONE ctermfg=NONE

set tags=./.tags;,.tags

map <C-m> :NERDTreeToggle<CR>
map <C-m> :NERDTreeToggle<CR>

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }



set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,javascript': ['re!\w{2}'],
           \ }


"for cpp enhanced color
let c_no_curly_error=1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"for CSyntaxAfter
"autocmd! FileType c,cpp,java,php call CSyntaxAfter()
"

"for vim-perforce
let g:perforce_open_on_change = 1
"let g:perforce_use_relative_paths = 1
"
"
if has('gui_running')
	set background=dark
"	set background=light
"	colorscheme solarized
"	colorscheme jellybeans
"	colorscheme monokai
	colorscheme my_jellybeans
"	colorscheme tender
"	colorscheme monokai_pro
"	colorscheme material
"	colorscheme subtle_light
else
    set background=dark
"	colorscheme monokai
"	colorscheme vividchalk
"	colorscheme jellybeans
	colorscheme my_jellybeans
"	colorscheme tender
"	colorscheme ir_black 
endif
