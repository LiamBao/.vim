source /Users/liambao/Desktop/github/spacemacs_and_vim/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on


"--------
" Vim UI
"--------
" color scheme
set background=dark
colorscheme=solarized

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search/
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set tex=Monaco:13pt
set history=1000
set nocompatible
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines aboverbelow cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
" set relativenumber


" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=85
" set smarttab
set expandtab       " expand tab to space

autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=85
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
"autocmd FileType shell,bash tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"-----------------
" Plugin settings
"----------------
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
"let g:EasyMotion_leader_key = '<Leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object,
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif

" Nerd Tree
"自动加载NerdTree
autocmd vimenter * NERDTree
" 显示书签列表
let NERDTreeShowBookmarks=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
"无其他文件时关闭tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" 打开当前文件目录
nn <silent><C-o> :exec("NERDTree ".expand('%:h'))<CR>
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" more options: ['json', 'nginx', 'golang', 'ruby', 'less', 'json', ]
let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'

" powerline
let g:Powerline_symbols = 'fancy'

" NeoComplCache
" " 启用 neocomplcache.
let g:neocomplcache_enable_at_startup=1

let g:neoComplcache_disableautocomplete=0
" 启用下划线补全
let g:neocomplcache_enable_underbar_completion = 1
"" 启用大写字母补全
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
" 设定最小语法关键词长
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

" SuperTab
let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-x><C-u>'
let g:SuperTabRetainCompletionType=2

" ctrlp
" QuickStart Launch using <c-p>.
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" for macvim
" if has("gui_running")
    " set go=aAce  " remove toolbar
    " "set transparency=30
    " set background=dark
    " colorscheme solarized
    " set guifont=Monaco:14pt
    " set showtabline=2
    " set columns=140
    " set lines=40
    " noremap <D-M-Left> :tabprevious<cr>
    " noremap <D-M-Right> :tabnext<cr>
    " map <D-1> 1gt
    " map <D-2> 2gt
    " map <D-3> 3gt
    " map <D-4> 4gt
    " map <D-5> 5gt
    " map <D-6> 6gt
    " map <D-7> 7gt
    " map <D-8> 8gt
    " map <D-9> 9gt
    " map <D-0> :tablast<CR>
" endif



"========  by Liam  ==========
"<leader>cc 注释当前行
" <leader>cm 只用一" " 组符号来注释
" <leader>cy 注释并复制
" <leader>cs 优美的注释
" <leader>cu 取消注释
">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"         "YouCompleteMe config
"install:
"brew install cmake
"cd ~/.vim/bundle/YouCompleteMe
"sudo ./install.sh --clang-completer

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"specifying the Python binary interpreter to use
"let g:ycm_python_binary_path = '/Users/liambao/.virtualenvPython/weibo/bin/python'
"let g:ycm_python_binary_path = '/Users/liambao/.virtualenvPython/machinelearning/python'

"nnoremap <leader>gg :YouCompleter GoDeclaration<CR>
"nnoremap <leader>dd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gi :YouCompleter GoToInclude<CR>

"will be searched through the PATH
"let g:ycm_python_binary_path = 'python'
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"fold code
"set nofoldenable                                                  " disable folding"
"set foldmethod=indent
"set foldlevel=1
"set foldclose=all
"In-file Controls
"zo - opens folds
"zc - closes fold
"zm - increases auto fold depth
"zr - reduces auto fold depth
"And if you ever get annoyed with the folds, use
": set foldmethod=syntax
"or press:
"zR

"在输入一个很长的行时，vim 总是会自动换行，并插入一个换行符
"我们需要的是自动换行显示，但不要自动插入换行符
autocmd FileType text setlocal textwidth=0
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
"set wrap           "设置自动折行
"set nowrap        "设置不自动折行

" 左右光标键切换 buffer
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>


"将分号和冒号互换
nnoremap ; :
nnoremap : ;


"使用 \ 键打开当前编辑的文件
nnoremap \ :!open <C-R>%<CR><CR>

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=10

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" change the mapleader from \ to ,
let mapleader=","
let g:mapleader=","

"粘贴时不置换“剪贴板”
xnoremap p pgvy

"交换#和*, #更近
" switch # *
nnoremap # *
nnoremap * #

set gcr=a:block-blinkon0  " 禁止光标闪烁

" I dont like vim to ever write a backup file,just Git~
set nobackup
set noswapfile


set magic


"highlight whitespaces for python programming
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

" QuickStart Toggle comments using <Leader>c<space> in Visual or Normal mode,

"ignore warning
let g:go_version_warning = 0

"QUICK RUN
map <F12> : call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java%<"
    endif
endfunc

"字符超出80个的话就把那些字符的背景设为红色
"highlight OverLength ctermbg=white  ctermfg=red guibg=#592929
"match OverLength /\%90v.\+/
"=============================



"   nerdtree 操作
""    ?: 快速帮助文档
""    o: 打开一个目录或者打开文件，创建的是buffer，也可以用来打开书签
""    go: 打开一个文件，但是光标仍然留在NERDTree，创建的是buffer
""    t: 打开一个文件，创建的是Tab，对书签同样生效
""    T: 打开一个文件，但是光标仍然留在NERDTree，创建的是Tab，对书签同样生效
""    i: 水平分割创建文件的窗口，创建的是buffer
""    gi: 水平分割创建文件的窗口，但是光标仍然留在NERDTree
""    s: 垂直分割创建文件的窗口，创建的是buffer
""    gs: 和gi，go类似
""    x: 收起当前打开的目录
""    X: 收起所有打开的目录
""    e: 以文件管理的方式打开选中的目录
""    D: 删除书签
""    P: 大写，跳转到当前根路径
""    p: 小写，跳转到光标所在的上一级路径
""    K: 跳转到第一个子路径
""    J: 跳转到最后一个子路径
""    <C-j>和<C-k>: 在同级目录和文件间移动，忽略子目录和子文件
""    C: 将根路径设置为光标所在的目录
""    u: 设置上级目录为根路径
""    U: 设置上级目录为跟路径，但是维持原来目录打开的状态
""    r: 刷新光标所在的目录
""    R: 刷新当前根路径
""    I: 显示或者不显示隐藏文件
""    f: 打开和关闭文件过滤器
""    q: 关闭NERDTree
""    A: 全屏显示NERDTree，或者关闭全

