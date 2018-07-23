"execute pathogen#infect()
"filetype plugin indent on
set nocompatible              " be iMproved
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" YCM conf
let g:ycm_confirm_extra_conf = 0

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
syntax on
colorscheme distinguished

set guifont=Inconsolata\ Medium\ 14

" User Interface
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"Always show current position
set ruler
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set report=0 " tell us when anything is changed via :...
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]

set autoread

" F2 to toggle line numbers
set number
nnoremap <F2> :set nonumber!<CR>

" F3 to toggle paste mode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" F8 to toggle taglist
nnoremap <F8> :TlistToggle <CR>

" change tab page
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Text Formatting/Layout
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
set cindent " do c-style indenting
set smarttab " use tabs at the start of a line, spaces elsewhere
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab " Use spaces instead of tabs

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" load cscope db if exists
"if (getfsize("cscope.out") > 1)
"    :cs add cscope.out
"endif

" set soft line autowrap
set wrap linebreak nolist

" Minibuf
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1

" Matchit
let b:match_ignorecase = 1

" Autocommands
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.x :set ft=c " all my .x files are .h files
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" make cmd mk for panos
autocmd BufRead,BufNewFile /home/goat/ws/*/panos/* setlocal makeprg=mk
" Remember info about open buffers on close
set viminfo^=%

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" cscope key mappings
nmap <C-\><C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>f :scs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>i :scs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"set cscopequickfix=s+,c+,d+,e+,t+
