execute pathogen#infect()
syntax on
filetype indent plugin on

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

"Set italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Map leader \ to ,
let mapleader = ","

set termguicolors
set encoding=utf-8
set clipboard=unnamed
set ruler
set number
set relativenumber
set mouse=a
set laststatus=2
set colorcolumn=80
set cursorline
set autowrite

"Set split
set splitbelow
set splitright

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"https://github.com/jiangmiao/auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

"Set themes
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \ 	 'default': {
  \        'transparent_background': 0,
  \        'allow_bold': 1,
  \        'allow_italic': 1,
  \	 }
  \    }
  \ }

set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'

"Overwrite background and comments color
"highlight Normal ctermfg=black ctermbg=white
"highlight NonText ctermbg=white cterm=bold
"highlight Comment ctermfg=white ctermbg=grey
"highlight Special cterm=bold

execute pathogen#infect()
syntax on

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plugin 'ervandew/supertab'
"Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

"Set italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set termguicolors
set encoding=utf-8
set clipboard=unnamed
set ruler
set number
set relativenumber
set mouse=a
set laststatus=2
set colorcolumn=80
set cursorline

"Set split
set splitbelow
set splitright

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Set themes
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \ 	 'default': {
  \        'transparent_background': 0,
  \        'allow_bold': 1,
  \        'allow_italic': 1,
  \	 }
  \    }
  \ }

set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'

"Overwrite background and comments color
"highlight Normal ctermfg=black ctermbg=white
"highlight NonText ctermbg=white cterm=bold
"highlight Comment ctermfg=white ctermbg=grey
"highlight Special cterm=bold

"Set Golang
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
"let g:go_fmt_options = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
"let g:go_list_type = "quickfix"

autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

"autocmd FileType go map <C-n> :cnext<CR>
"autocmd FileType go map <C-m> :cprevious<CR>
"autocmd FileType go nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"Set JavaScript
let g:ale_linters = {
\   'javascript': ['standard'],
\}

autocmd bufwritepost *.js silent !standard --fix %
set autoread

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

"Set NERDTree
autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Set space for JavaScript
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

let g:pymode_python = 'python3'
let g:pymode_indent = 0
let python_highlight_all=1

autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1




" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


" Set mapping for Ag
nnoremap <C-f> :Ag<Enter>

" Ctrl + S to save
noremap <silent> <C-S>          :write<CR>
vnoremap <silent> <C-S>         <C-C>:write<CR>
inoremap <silent> <C-S>         <C-C>:write<CR>
"# ~/.zshrc
"# enable control-s and control-q
"stty start undef
"stty stop undef
"setopt noflowcontrol
"
"
"Move to the right while in insert mode
inoremap <C-l> <Right>
inoremap <C-j> <C-o>o

"Improve search
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>


"Easy cd to directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
