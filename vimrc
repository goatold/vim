execute pathogen#infect()
set nocompatible              " be iMproved
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
syntax on
colorscheme distinguished
filetype plugin indent on

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
if (getfsize("cscope.out") > 1)
    :cs add cscope.out
endif

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

