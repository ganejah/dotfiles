" dir
" ~/.vim
"   |-- backup
"   `-- bundle

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" common
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/Highlight-UnMatched-Brackets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Gist.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'slim-template/vim-slim'
" colorscheme
NeoBundle 'molokai'
NeoBundle 'Solarized'
" ブラウザーで開く
NeoBundle 'tyru/open-browser.vim'
" jkのスクロールが徐々に加速する
NeoBundle 'rhysd/accelerated-jk'
" ステータスライン
NeoBundle 'itchyny/lightline.vim'
" まとめてコメントアウトできる
NeoBundle 'tomtom/tcomment_vim'
" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'Konfekt/FastFold'
NeoBundle 'godlygeek/tabular'
" Table
NeoBundle 'dhruvasagar/vim-table-mode'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

call neobundle#end()

filetype plugin indent on

"---------------------------------------------------------------------------
" colorscheme
"
syntax on
"set background=dark
set t_Co=256
colorscheme molokai

"---------------------------------------------------------------------------
" file
"
" complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags


" encoding
set fileformats=unix,mac,dos
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif


" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" swapfile
set swapfile
set directory=~/.vim/tmp

" backup
set backup
set backupdir=~/.vim/backup

" whitespace
autocmd BufWritePre * :%s/\s\+$//e

" WhitespaceEOL
highlight WhitespaceEOL ctermbg=gray guibg=gray
match WhitespaceEOL /\s\+$/

" buffer
set hidden

"---------------------------------------------------------------------------
" motion
"

" tab & indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" cmd
set showcmd

" 行番号を表示
set number

" BS
set backspace=indent,eol,start

" ESC
inoremap <C-j> <esc>
inoremap jj <esc>

" search highlight
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" repeated indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" vimgrep
autocmd QuickfixCmdPost vimgrep cw

"---------------------------------------------------------------------------
" plugin
"

let g:neocomplcache_enable_at_startup = 1
" neocomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

" unite
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim-powerline
set laststatus=2
"let g:Powerline_symbols = 'fancy'

" vcscommand.vim
command! SD :VCSVimDiff

" multi cursor
let g:multi_cursor_use_default_mapping=0

let g:cssColorVimDoNotMessMyUpdatetime = 1

" emmet > ctrl + e
 let g:user_emmet_expandabbr_key = '<c-e>'

" accelerated
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" statusline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set laststatus=2

" open browser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" markdown
au BufRead,BufNewFile *.md set filetype=markdown
" markdown for table
let g:table_mode_always_active = 1
"
let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown

" カーソルの回り込み
set whichwrap=b,s,[,],<,>
" buffer setting
nmap <silent> <C-n>      :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
