" ------------------------------------------------------------------------
" -----------------------------   vimrc   --------------------------------
" ------------------------------------------------------------------------

" ------------------------------- System ---------------------------------
" ------------------------------------------------------------------------

" --------- Vundle ---------
" --------------------------

if has("win32")
    set runtimepath+=~/vimfiles/bundle/vundle
else
    set runtimepath+=~/.vim/bundle/vundle
endif

filetype off

" Setup vundle
call vundle#rc()

" Let vundle manage vundle
Bundle 'gmarik/vundle'

" Original repos
Bundle 'altercation/vim-colors-solarized'
Bundle 'derekwyatt/vim-scala'
Bundle 'digitaltoad/vim-jade'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'garbas/vim-snipmate'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/zencoding-vim'
Bundle 'nacitar/a.vim'
Bundle 'nono/vim-handlebars'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'suan/vim-instant-markdown'
Bundle 'tikhomirov/vim-glsl'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tlib_vim'

" Original mirrors
Bundle 'voithos/vim-multiselect'
Bundle 'voithos/vim-python-matchit'
Bundle 'voithos/vim-python-syntax'

" Forks
Bundle 'voithos/vim-colorpack'
Bundle 'voithos/snipmate-snippets'

" vim-scripts repos
Bundle 'bufkill.vim'
Bundle 'cool.vim'
Bundle 'genutils'
Bundle 'ini-syntax-definition'
Bundle 'matchit.zip'
Bundle 'taglist.vim'

" --------------------------

" Turn on filetype plugin and indentation handling
filetype plugin indent on


" Set map leader
let mapleader = ','

" Includes
if has("win32")
    " Add extra filetypes
    source ~/vimfiles/filetypes.vim
    " Extra helper functions
    source ~/vimfiles/functions.vim
else
    " Add extra filetypes
    source ~/.vim/filetypes.vim
    " Extra helper functions
    source ~/.vim/functions.vim
endif

" ------------------------------- General --------------------------------
" ------------------------------------------------------------------------
" Make Vim more useful than Vi
set nocompatible

" Increase history size
set history=1000

" Allow changing of buffers without saving
set hidden

" Set the directory of the swap file
" The // indicates that the swap name should be globally unique
set directory=~/.vim/tmp//,/tmp

" Enable backup files and specify backup directories
set backupdir=~/.vim/backup/,/tmp
set backup

" Enable undo
set undodir=~/.vim/undo
set undofile

" Enable viminfo file, and create autocmd to restore file
" position between edits
set viminfo='10,<100,:20,%

function! ResCur()
    if line("'\"") < line("$")
        normal! g'"
        return 1
    endif
endfunction

autocmd BufReadPost * call ResCur()

" Use the bash shell
set shell=/bin/bash

" Use UTF-8 for internal text
set encoding=utf-8

" Try the following EOL formats when opening a new file
set fileformats=unix,dos,mac

" Automatically insert comment leader
set formatoptions=q

" Do not redraw while running macros
set lazyredraw

" ------------------------------- Editing --------------------------------
" ------------------------------------------------------------------------
" Make backspace more flexible
set backspace=eol,start,indent

" Turn on syntax highlighting
syntax enable

" Set the tab stop to the given value and enable tab-to-space expansion
set tabstop=4
set shiftwidth=4
set expandtab

" Make sure that makefiles don't break
autocmd FileType make setlocal noexpandtab

" Make sure that <BS> deletes a "shiftwidth" worth of spaces
set smarttab

" Make the indent carry to the next line
set autoindent

" Jump to the corresponding brace when inserting closing braces
" for the given time, in tenths of a second
set showmatch
set matchtime=3

" ------------------------------ Interface -------------------------------
" ------------------------------------------------------------------------
" Set options for GUI vs shell
if has("gui_running")
    " Disable the toolbar
    set guioptions-=T

    " Set theme options
    colorscheme molokai
    set background=dark

    " Set font
    if has("win32")
        set guifont=Consolas:h10:b:cANSI
    else
        set guifont=Source\ Code\ Pro\ For\ Powerline\ 10
    endif
else
    " Enable more colors for the terminal
    set t_Co=256

    " Set theme options
    colorscheme earendel
    set background=dark
endif

" Turn on Wild Menu for command completion
set wildmenu

" Set the title to be more meaningful
set title

" Keep the screen neat by not wrapping long lines
set nowrap

" Set whitespace characters to use when using list
set listchars=eol:¬,tab:»­,trail:·

" Enable an warning when exceeding a certain line length
set colorcolumn=80

" Enable line numbers
set number

" Show the line and column numbers
set ruler

" Increase height of Vim command prompt
set cmdheight=2

" Enable status line for all files
set laststatus=2

" Set the status line to show useful information, in case Powerline
" is not installed
set statusline=\ %F%m%r%h\ %w\ \ [%{&ff}]%y\ Line:\ %l/%L:%c\ (%p%%)

" Always report number of lines modified
set report=0

" Maintain a certain number of lines between the cursor
" and the end of the window
set scrolloff=7

" ------------------------------ Searching -------------------------------
" ------------------------------------------------------------------------
" Ignore case in searching by default, unless there are capitals
set ignorecase
set smartcase

" Match searches immediately, and highlight subsequent matches
set incsearch
set hlsearch

" ------------------------------ Mappings --------------------------------
" ------------------------------------------------------------------------
" Map list command
nnoremap <silent> <leader>l :set list!<CR>

" Map window switching shortcut
nnoremap <silent> <leader>w <C-W><C-W>

" Map CTRL+L to clear highlight search
noremap <silent> <C-L> :silent nohlsearch<CR>

" Map CTRL+Backspace to delete words in insert mode
inoremap <C-BS> <C-W>

" Map CTRL+S to select all
nnoremap <C-S> ggVG

" Map CTRL+P, CTRL+X and CTRL+Y for clipboard register paste and copy operations
nnoremap <C-P> "+gp
inoremap <C-P> <ESC><C-P>a
vnoremap <C-X> "+d
vnoremap <C-Y> "+y
vnoremap <C-P> "+gP

" Replace the backtick with the apostrophe, for better accessibility
nnoremap ' `
nnoremap ` '

" Same with the colon and semicolon; colon is used very often
nnoremap : ;
nnoremap ; :

" Map Enter and Shift-Enter to insert newlines below and above the cursor
nnoremap <CR> o<Esc>0d$
nnoremap <S-CR> O<Esc>0d$

" Helper functions to avoid BufChange'ing the NERD tree window
function! BufNext()
    if exists("t:NERDTreeBufName")
        if bufnr(t:NERDTreeBufName) != bufnr('')
            bn
        endif
    else
        bn
    endif
endfunction

function! BufPrev()
    if exists("t:NERDTreeBufName")
        if bufnr(t:NERDTreeBufName) != bufnr('')
            bp
        endif
    else
        bp
    endif
endfunction

" Map buffer navigation easier
nnoremap <silent> <leader>j :call BufNext()<CR>
nnoremap <silent> <leader>k :call BufPrev()<CR>

" Make the arrow keys useful
nnoremap <silent> <down> :bn<CR>
nnoremap <silent> <up> :bp<CR>
nnoremap <silent> <left> :NERDTreeToggle<CR>
nnoremap <silent> <right> :Tlist<CR>

" Map easier shortcuts to common plugins
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>q :BW<CR> " Close buffer without closing window
nnoremap <silent> <leader>g :GundoToggle<CR>

" ------------------------------- Plugins --------------------------------
" ------------------------------------------------------------------------
" NERDCommenter
let NERDSpaceDelims=1

" NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Powerline
let g:Powerline_symbols = 'fancy'

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" Zencoding
let g:user_zen_leader_key = '<c-j>'

" ------------------------ Environment-Specific --------------------------
" ------------------------------------------------------------------------
if has("win32")
    " Try DOS EOL first
    set fileformats=dos,unix,mac

    " Fix shell options
    set shell=cmd.exe
    set shellcmdflag=/C

    " Specify swap directory
    set directory=~/vimfiles/tmp//,$TMP

    " Specify backup directory
    set backupdir=~/vimfiles/backup/,$TMP

    " Specify undo directory
    set undodir=~/vimfiles/undo

    " Switch to tabs
    set noexpandtab

    " Don't try to use special symbols for powerline
    let g:Powerline_symbols = 'compatible'
endif

