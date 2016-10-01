

" ----------------------------------------------------------------------------------------
"   neobundle
" ----------------------------------------------------------------------------------------
set nocompatible               " Be iMproved

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
                \ 'windows' : 'make -f make_mingw32.mak',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'unix' : 'make -f make_unix.mak',
        \ },
\ }

filetype plugin indent on     " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

NeoBundle "tpope/vim-endwise"


NeoBundle "Shougo/neosnippet"


NeoBundle "Shougo/neosnippet-snippets"


NeoBundle "Shougo/neocomplcache"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1

if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif


NeoBundle "scrooloose/nerdtree"
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=28


NeoBundle "thinca/vim-guicolorscheme"


NeoBundle "Shougo/unite.vim"
let g:unite_data_directory = '/Users/keke/.vim/tmp/unite/'


NeoBundle "vim-scripts/taglist.vim"
NeoBundle "szw/vim-tags"
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 35
nmap <silent> <C-l>      :TlistToggle<CR>
vmap <silent> <C-l> <Esc>:TlistToggle<CR>
omap <silent> <C-l>      :TlistToggle<CR>
imap <silent> <C-l> <Esc>:TlistToggle<CR>
cmap <silent> <C-l> <C-u>:TlistToggle<CR>


NeoBundle "Lokaltog/powerline", { 'rtp' : 'powerline/bindings/vim'}


NeoBundle "tyru/caw.vim.git"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)


NeoBundle "fholgado/minibufexpl.vim"
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplUseSingleClick = 1

nnoremap st       :<C-u>MBEToggle<CR>
nnoremap t<Right> :<C-u>MBEbn<CR>
nnoremap t<Left>  :<C-u>MBEbp<CR>


NeoBundle "vadimr/bclose.vim"
nnoremap sq :<C-u>Bclose<CR>

NeoBundle "thinca/vim-splash"



"--------------------------------------------------------
"
"Vimのオプション設定
"
"--------------------------------------------------------

if has("syntax")
  syntax on
endif

set t_Co=256     "256色モード
set cursorline   " カーソルライン
set number       " 行番号
set laststatus=2 "0,1,2) ステータスラインを常に表示
set autoindent   "自動インデント有効
set shiftwidth=2 "自動インデントのスペース数
set tabstop=2    "タブのスペース数
set expandtab    "タブキーをスペースに置き換え
set mouse=a      "マウスを有効
set ttymouse=xterm2              "xtermっぽくマウスを使う
set clipboard=unnamed            "OSのクリップボードを使う
set backspace=indent,eol,start   "バックスペースキーの動作設定
set nowrap                       "テキストを折り返さない
set whichwrap=b,s,<,>,[,]        "カーソルを行頭、行末で止まらないようにする
set wildmenu     "コマンドラインモード中のTabキーでファイル名補完を有効

colorscheme molokai_custom

nnoremap sw :<C-u>w<CR>
nnoremap sa :<C-u>qa<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

nnoremap s<Right> <C-w>l
nnoremap s<Left> <C-w>h
nnoremap s<Down> <C-w>j
nnoremap s<Up> <C-w>k

function IDEMode()
  :execute ":MBEOpen"
  :execute ":NERDTree"
  :execute ":TlistToggle"
  :execute "normal \<C-w>l"
  :execute ":Splash ~/.vim/vim_logo1.txt"
endfunction

autocmd vimenter * if !argc() | :call IDEMode() | endif


