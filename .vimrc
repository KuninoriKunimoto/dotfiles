"新しい行のインデントを現在行と同じに
set autoindent
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"インクリメンタルサーチ
set incsearch
"行番号を表示
set number
"閉じ括弧が入力されたとき、対応する括弧を表示
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内でTab を打ち込むと'shiftwidth' の数だけインデント
set smarttab
"ファイル内が対応する空白の数
set tabstop=4
"検索をファイルの先頭へループしない
set nowrapscan
"入力モード時、ステータスラインのカラーを変更
syntax enable
" カラー設定(solarized使用)
set background=dark
colorscheme solarized
" レジスタを指定せずにコピー/ペーストを行なった場合は クリップボードを利用
set clipboard=unnamed,autoselect
" バックアップファイルを作らない
set nobk

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#242424 ctermbg=yellow
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=black
augroup END

"ウィンドウタイトル削除
set notitle

" Python向けインデント設定
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4

" その他のインデント設定
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" " インデントを設定
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

"vim立ち上げ時に自動的にvim-indent-guidesをオン
let g:indent_guides_enable_on_vim_startup = 1
"autoで色付けするのはストップ
let g:indent_guides_auto_colors = 0

" Vundle設定
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 各種プラグイン
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'git://github.com/Shougo/vimproc'
Bundle 'git://github.com/Shougo/vimshell'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'git://github.com/nvie/vim-pep8.git'
Bundle 'git://github.com/nvie/vim-flake8.git'
Bundle 'git://github.com/nvie/vim-pyflakes.git'
Bundle 'skammer/vim-css-color'
Bundle 'JavaScript-syntax'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'skwp/vim-rspec'
Bundle 'Rykka/riv.vim' 
Bundle 'ngmy/vim-rubocop'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'hokaccha/vim-html5validator'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on

"NERDTreeのキーバインド 
nmap <F9> :NERDTreeToggle
"VimShellのキーバインド 
nmap <F8> :VimShell

" neocomplcache設定
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
let g:neocomplcache_force_overwrite_completefunc = 1
" neocomplcache設定ここまで

let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
