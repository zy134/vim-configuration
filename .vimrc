"f8:tagbar
"f9:nerdtree
"f10:quickfix
"设置文件编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

"设定leader键
let mapleader=','

let g:solarized_termcolors=256
"设置主题
syntax on 
set background=dark
colorscheme onedark
"常用主题onedark,xcodelight,xcodedark,xcodewwdc
"gotham,gotham256,solarized

set cursorline 
"设置保持历史记录10000
set history=10000
"打开文件时禁止折叠
set nofoldenable
"按照缩进折叠
set fdm=syntax 
set display=lastline
set scrolloff=5
set matchtime=2
set matchpairs+=<:>
set number
set showcmd
set showmatch


" 设置文件不备份，这里被注释掉；
set nobackup
set noundofile
set noswapfile
"set backupext=.bak
"set backupdir=~/.vim/vim_bak/

"语法高亮
set syntax=on
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
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase

set incsearch

set autoread
set autowrite

"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'preservim/nerdtree'

"md编辑套件
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"markdown预览套件，mathjax用于显示数学公式
"Plugin 'iamcco/markdown-preview.vim'
"Plugin 'iamcco/mathjax-support-for-mkdp'


Plugin 'jiangmiao/auto-pairs'
"底部状态栏美化
"Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-powerline'
"缩进指示线，在编辑py的时候很不错
Plugin 'Yggdroot/indentLine'

"主题
Plugin 'altercation/vim-colors-solarized'

"异步运行
Plugin 'skywind3000/asyncrun.vim'
"针对C++的语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight' 
"ale语法检查
Plugin 'w0rp/ale' 

"标签导航插件
Plugin 'majutsushi/tagbar'

"彩虹括号
Plugin 'luochen1990/rainbow'


call vundle#end()
filetype plugin indent on
"==============================================================
"YCM

" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也不能补全
let g:ycm_complete_in_comments=0
"关闭额外预览窗口
let g:ycm_add_preview_to_completeopt = 0
"基于syntastic的代码诊断，觉得慢的话可以换成ale
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }


"ycm补全框颜色


highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"==============================================================
"nerdtree
"vim打开空文件时直接打开文件树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"vim打开文件夹时打开文件树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NERDTree.vim
" let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
" let g:NERDTreeShowLineNumbers=1
" let g:neocomplcache_enable_at_startup = 1 
nnoremap <F8> :NERDTreeToggle<cr>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"=================================================================
"asyncrun

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

let g:asyncrun_mode='async'


"=================================================================
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

"================================================================
"ale                                                             
"始终开启标志列                                                  
let g:ale_sign_column_always = 0                                 
let g:ale_set_highlights = 0                                     
"自定义error和warning图标                                        
let g:ale_sign_error = '✗'                                       
let g:ale_sign_warning = '⚡'                                    
"在vim自带的状态栏中整合ale                                      
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']          
"显示Linter名称,出错或警告等相关信息                             
let g:ale_echo_msg_error_str = 'E'                               
let g:ale_echo_msg_warning_str = 'W'                             
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'         
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告      
nmap sp <Plug>(ale_previous_wrap)                                
nmap sn <Plug>(ale_next_wrap)                                    
"<Leader>s触发/关闭语法检查 

"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'always'
"打开文件时不进行检查
"let g:ale_lint_on_enter = 0
"
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python' : ['flake8']
\}

"===============================================================
"powerline
set laststatus=2
let g:Powerline_symbols='unicode'

"================================================================
"airline
""安装字体后必须设置
"let g:airline_powerline_fonts = 1
"关闭tabline
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'



"================================================================
"rainbow

let g:rainbow_active = 1

let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}


"================================================================
"tagbar
"设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='/usr/bin/ctags'
""设置tagbar的窗口宽度
let g:tagbar_width=25
"设置tagbar的窗口显示的位置,为右边
let g:tagbar_left=0
"打开文件自动 打开tagbar
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"映射tagbar的快捷键
map <F9> :TagbarToggle<CR>
