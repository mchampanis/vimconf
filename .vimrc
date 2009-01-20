autocmd!   

:colorscheme railscasts

let mapleader = ","

set t_Co=256
set vb
set nowrap
set nocompatible
set nu
set nobackup
set shell=$SHELL\ -f
set ruler
set backspace=indent,eol,start
set history=100
set showcmd	
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set display=lastline
set ttyfast
set shm+=I
set shell=bash
set showmode
set hlsearch
set foldenable
set foldmethod=marker
set autoindent 
set clipboard=autoselect
set wrapscan
set textwidth=120
set ignorecase 
set smartcase
set hidden
set wildmenu
set wildmode=list:longest
set scrolloff=3
set shortmess=atI

syntax on
filetype on
filetype plugin on
filetype indent on

nnoremap <Leader>wn :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

" Paste mode on/off
map <F4> :call Toggle_paste()<CR>
set pastetoggle=<F4>

let paste_mode = 0

func! Toggle_paste()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif  
return
endfunc 
" end

nmap <Leader>t :NERDTreeToggle<CR>
nmap <C-N> :set invnumber<CR>

map <F3>:set invhls hls?<CR>
imap <F3> <Esc>:set invhls hls?<CR>i

map <F5>:w <CR>
imap <F5> <Esc>:w<CR>i

map  <F6> :r !date<CR>
imap <F6> <Esc>:r !date<CR>i

map M :set paste!<bar>set paste?<CR>
map F :set formatoptions=tcql<bar>set tw=72<CR>
map s :source $HOME/.vimrc<CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let c_syntax_for_h=1
let perl_fold=1

" nnoremap ' `
" nnoremap ` '

if has("autocmd")
  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=120

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  if &term == "xterm" || &term == "vt220" || &term == "terminal"
    set title 
  endif
  
  autocmd BufEnter * let &titlestring = $HOSTNAME . ":" . expand("%:p:~")
  
  function! IncSearch()
    if line2byte(line("$")) < 10000000
      set incsearch
    else
      set noincsearch
    endif
  endfunction

  autocmd BufReadPost * call IncSearch()

  if &filetype == ""
    setfiletype text
  endif

  function! PoundComment()
    map - 0i# <ESC>j
    map _ :s/^\s*# \=//g<CR>j
    set comments=:#
  endfunction

  autocmd Filetype sh call PoundComment()
  autocmd Filetype ruby call PoundComment() 
else
endif " has("autocmd")
