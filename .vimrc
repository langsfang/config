syntax on

let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 80 
" let g:netrw_browse_split=2
let g:netrw_altv = 1
" let g:netrw_banner = 0
let g:netrw_browsex_viewer= "xdg-open"
let g:Tlist_Use_Right_Window = 1

map ` :Tlist<CR>

set background=dark

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set wildmenu
set hlsearch	
set foldmethod=syntax 
set foldlevel=100       "without this line, vim will automatic folds
set shiftwidth=2
set tabstop=2
set expandtab
set prompt
set ruler
set clipboard=unnamedplus
set rnu

let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyAlignRight = 'yes'

" let g:completekey = ','
let g:completekey = '<C-l>'

let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Also load indent files, to automatically do language-dependentindenting.
filetype plugin indent on

" For all text files set ¡®textwidth¡¯ to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don¡¯t do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

endif " has("autocmd")

if filereadable("/etc/vimrc")
  source /etc/vimrc
endif

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
set completeopt=menu,menuone,longest
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
" call pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
"Plugin 'jeaye/color_coded'
Plugin 'rdnetto/YCM-Generator'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
" Plugin 'jeaye/color_coded'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on     " required!

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/home/langs/dev/.ycm_extra_conf.py'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F4> :YcmCompleter GoTo<CR>
let g:ycm_key_detailed_diagnostics = '<F3>'

set t_Co=256

set laststatus=2
"hi Function	ctermfg=darkcyan cterm=bold
"hi Comment	ctermfg=magenta
