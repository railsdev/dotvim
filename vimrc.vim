" ------------------------------------------------------------------------
" -----------------------------   vimrc   --------------------------------
" ------------------------------------------------------------------------

" ------------------------------- System ---------------------------------
" ------------------------------------------------------------------------

" --------- Plugin Manager ---------
" ----------------------------------

" Setup NeoBundle
if has("win32")
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
  call neobundle#rc(expand('~/vimfiles/bundle/'))
else
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Original repos
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'crusoexia/vim-monokai'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'vim-scripts/genutils'
NeoBundle 'vim-scripts/ini-syntax-definition'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'kchmck/vim-coffee-script'

" Original mirrors
NeoBundle 'voithos/vim-multiselect'
NeoBundle 'godlygeek/tabular'
NeoBundle 'fatih/vim-go'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'ervandew/supertab'
NeoBundle 'mjbrownie/browser'
" NeoBundle 'Yggdroot/indentLine'
" Forks
NeoBundle 'voithos/vim-colorpack'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'xolox/vim-misc'
NeoBundle 'lambdalisue/vim-fullscreen'

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
call plug#end()
" Platform-specific
if has("win32")
  NeoBundle 'vim-scripts/aspnetcs'
else
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'vim-scripts/AutoTag'
endif

" Turn on filetype plugin and indentation handling
filetype plugin indent on

NeoBundleCheck

" --------------------------

" Set map leader
let mapleader = ','

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
set directory=~/.vim/tmp//,/tmp//

" Enable backup files and specify backup directories
set backupdir=~/.vim/backup//,/tmp//
set backup

" Enable undo
set undodir=~/.vim/undo
set undofile

" Specify spelling file
set spellfile=~/.vim/spell/spell.utf-8.add

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

" Lower keycode timeout, to avoid lag when using <ESC> in terminal vim
" (ESC is a common starting character for terminal escape sequences)
set ttimeoutlen=100

" ------------------------------- Editing --------------------------------
" ------------------------------------------------------------------------
" Make backspace more flexible
set backspace=eol,start,indent

" Turn on syntax highlighting
syntax enable

" Set the tab stop to the given value and enable tab-to-space expansion
set tabstop=2
set shiftwidth=2
set expandtab

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
  set t_Co=256

  " Set theme options
  syntax enable
  set background=light
  " let g:solarized_contrast = "high"
  " let g:solarized_visibility = "low"
  " colorscheme distinguished
  " colorscheme codeschool 
  " colorscheme gotham256 
  " colorscheme Tomorrow-Night-Eighties

  colorscheme Tomorrow-Night 
  " colorscheme nu-colors 

  " set background=dark

  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove right-hand scroll bar
  " Set font
  if has("win32")
    set guifont=Consolas:h10:b:cANSI
  else
    " set guifont=Source\ Code\ Pro\ For\ Powerline\ Bold\ 10 
    " set guifont=Monaco\ for\ Powerline\ Bold\ 10
    " set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Bold\ 12 
    set guifont=Menlo\ for\ Powerline\ Bold\ 13 
    " set guifont=Droid\ Sans\ \Mono derivative\ Powerline\ 11 
    " set guifont=Monaco\ for\ Powerline\ Bold\ 10

  endif
else
  " Enable more colors for the terminal
  set t_Co=256
  
  if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
  endif

  " Set theme options
  set background=dark
  syntax enable
  colorscheme monokai 

endif

" Turn on Wild Menu for command completion
set wildmenu

" Set the title to be more meaningful
set title

" Keep the screen neat by not wrapping long lines
" set nowrap

set wrap " wrap lines, we dont want long lines
set showbreak=↪ " character show when wrapping line
" Set whitespace characters to use when using list
set listchars=eol:¬,tab:»\ ,trail:·

" Set list by default
set list

" Enable an warning when exceeding a certain line length
set colorcolumn=

" Enable line numbers
set number

" Show the line and column numbers
set ruler

" Increase height of Vim command prompt
set cmdheight=2

" Enable status line for all files
set laststatus=1

" Set the status line to show useful information
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
set linespace=4

" ------------------------------ Mappings --------------------------------
" ------------------------------------------------------------------------
" Map spellcheck toggle
nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>

" Map list command
nnoremap <silent> <leader>l :set list!<CR>

" Map window switching shortcut
nnoremap <silent> <leader>w <C-W><C-W>

" Map CTRL+L to clear highlight search
noremap <silent> <C-L> :silent nohlsearch<CR>

" Map CTRL+Backspace to delete words in insert mode
inoremap <C-BS> <C-W>

" Map CTRL+S to select all
nnoremap <C-A> ggVG
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Map clipboard register paste and copy operations
nnoremap <C-P> "+gp
inoremap <C-P> <C-R>+
vnoremap <C-X> "+d
vnoremap <C-Y> "+y
vnoremap <C-P> "+gP

" Replace the backtick with the apostrophe, for better accessibility
nnoremap ' `
nnoremap ` '

" Same with the colon and semicolon; colon is used very often
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Map Enter and Shift-Enter to insert newlines below and above the cursor
nnoremap <CR> o<ESC>0d$
nnoremap <S-CR> O<ESC>0d$

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

function! BufWipe()
  if exists("t:NERDTreeBufName")
    if bufnr(t:NERDTreeBufName) != bufnr('')
      BW
    endif
  else
    BW
  endif
endfunction

" Map buffer navigation easier
nnoremap <silent> <M-Right> :call BufNext()<cr>
nnoremap <silent> <M-Left> :call BufPrev()<cr>

" Map buffer navigation easier
nnoremap <silent> <S-M-Right> :tabnext<cr>
nnoremap <silent> <S-M-Left> :tabprevious<cr>
nnoremap <silent> <C-M-n> :tabnew<cr>

" Map easier shortcuts to common plugins
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>q :call BufWipe()<CR> " Close buffer without closing window
nnoremap <silent> <leader>gu :GundoToggle<CR>
nnoremap <silent> <leader>e :TagbarToggle<CR>
nnoremap <silent> <leader>vt :SignifyToggle<CR>

" Map timestamp functions
" nnoremap <F4> a<C-R>=strftime("%m/%d/%y")<CR><ESC>
" inoremap <F4> <C-R>=strftime("%m/%d/%y")<CR>
" nnoremap <F3> a<C-R>=strftime("%Y-%m-%d %a")<CR>
" inoremap <F3> <C-R>=strftime("%Y-%m-%d %a")<CR>


set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

endif
" bind K to grep word under cursor

nnoremap K :Ag! "\bdef\s<C-R><C-W>\b"<CR>:cw<CR>
nnoremap M :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
nmap <Leader>ct <Plug>silent! !ctags -R . &

" }}}


" ------------------------------- Plugins --------------------------------
" ------------------------------------------------------------------------
" NERDCommenter
let NERDSpaceDelims=1

" NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Airline
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_theme = "tomorrow"
" let g:airline_theme = "molokai"
" let g:airline_theme            = "powerlineish"
" let g:airline_enable_branch    = 0
" let g:airline_enable_syntastic = 1
" " function! AirlineInit()
" let g:airline_section_y = airline#section#create(['ffenc', ' ⮃ %{strftime("%H:%M")}'])
" " endfunction

" let g:airline_right_alt_sep     = '⮃'
" " autocmd VimEnter * call AirlineInit()


" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': [] }

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'


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
  set backupdir=~/vimfiles/backup//,$TMP

  " Specify undo directory
  set undodir=~/vimfiles/undo

  " Specify spelling file
  set spellfile=~/vimfiles/spell/spell.utf-8.add

  " Switch to tabs
  set noexpandtab

  " No powerline fonts
  " let g:airline_powerline_fonts = 1
endif

" ------------------------------ Includes --------------------------------
" ------------------------------------------------------------------------

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
map <silent> <C-F11>
      \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"------------------------------- Customs --------------------------------
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

"-------------------------- Bindings for VCSCommand  --------------------
nmap <Leader>va <Plug>VCSAdd
nmap <Leader>va <Plug>VCSAdd
nmap <Leader>vc <Plug>VCSCommit
nmap <Leader>vd <Plug>VCSDiff
nmap <Leader>vs <Plug>VCSStatus
nmap <Leader>vu <Plug>VCSUpdate
let g:signify_mapping_next_hunk = '<leader>gj' 
let g:signify_mapping_prev_hunk = '<leader>gk' 

" Use relative numbering in insert mode
set number
set relativenumber
:hi CursorLineNr guifg=#566978
" autocmd InsertLeave * set number
"
" Settings for Go-Lang
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" let g:indentLine_char = '│'
command! Wd write|bdelete
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
nnoremap o <NOP> 
let NERDTreeQuitOnOpen = 1


" fzf settings
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '40%' }

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Open files in horizontal split
nnoremap <silent> <c-?> :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>




" List of buffers
function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <NUL> :call fzf#run({
\   'source':  reverse(BufList()),
\   'sink':    function('BufOpen'),
\   'options': '+m',
\   'down':    '40%'
\ })<CR>

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction
let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'alt-j':  'botright split',
  \ 'alt-k':  'topleft split',
  \ 'alt-h':  'vertical topleft split',
  \ 'alt-l':  'vertical botright split' }

inoremap <expr> <c-x><c-s> fzf#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})

nnoremap <C-t> :call RunCurrentSpecFile()<CR>

let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
