filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'eshion/vim-sync'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

" those 4 are all for snipmate-snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
"Bundle 'garbas/vim-snipmate' " original
Bundle 'gregsexton/MatchTag'
" Bundle 'othree/html5.vim'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'mutewinter/nginx.vim'
Bundle 'StanAngeloff/php.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Townk/vim-autoclose'
" Bundle 'vim-scripts/XDebug-DBGp-client-for-PHP'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'docteurklein/vim-symfony'
Bundle 'shawncplus/phpcomplete.vim'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'junegunn/vim-easy-align'
Bundle 'skwp/vim-html-escape'
Bundle 'terryma/vim-multiple-cursors'

" syntax
Bundle 'evidens/vim-twig'
Bundle 'pangloss/vim-javascript'

Bundle 'scrooloose/syntastic'

" github vim scripts mirrors
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'fatih/vim-go'
Bundle 'bling/vim-airline'
Bundle 'jwalton512/vim-blade'
" Bundle 'fholgado/minibufexpl.vim'
"
Bundle 'Yggdroot/indentLine'

filetype plugin indent on

" common configuration
set number
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set hidden
set incsearch
set laststatus=2
set wildmenu
set wildmode=list:longest
" set wildignorecase
set completeopt=longest,menu,preview
set noswapfile
set scrolloff=999
set t_Co=256
set iskeyword-=-$
" set foldmarker={,}
" set foldmethod=marker
set hlsearch
set backspace=indent,eol,start


colorscheme pablo

" for vim-php-namespace
noremap <Leader>u :call PhpInsertUse()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>
noremap <silent><F10> :TagbarToggle<cr>
noremap <C-h> :NERDTree<CR>
noremap <C-l> :NERDTreeClose<CR>


vnoremap <silent> <Enter> :EasyAlign<cr>

" w!! to sudo save
cmap w!! %!sudo tee > /dev/null %

" autocmd BufWritePost *.php,*.twig,*.yml execute 'silent !php-cs-fixer fix % > /dev/null'
" autocmd BufWritePost *.php,*.twig,*.yml execute 'e'
" autocmd BufWritePost *.php,*.twig,*.yml execute 'syntax on'

let g:symfony_enable_shell_mapping=1
let g:UltiSnipsDontReverseSearchPath=1
let g:NERDTreeWinSize=25

let g:syntastic_php_checkers=['php', 'phpmd']

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <F4> <Plug>AirlineSelectNextTab
nmap <F3> <Plug>AirlineSelectPrevTab

let g:snips_author='yujicun'
syntax on


"PHP函数提示
autocmd FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
    set complete-=k complete+=k
endfunction

"{{{ whitespace 去除文件的行尾空白
autocmd BufWritePre *.php call WhitespaceStripTrailing()
autocmd BufWritePre *.lua call WhitespaceStripTrailing()
""}}}
function! WhitespaceStripTrailing()
    let previous_search=@/
    let previous_cursor_line=line('.')
    let previous_cursor_column=col('.')
    %s/\s\+$//e
    let @/=previous_search
    call cursor(previous_cursor_line, previous_cursor_column)
endfunction
" let g:debuggerPort = 10000
