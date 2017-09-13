" Started with tpope/vim-sensible
if exists('g:loaded_jm_settings') || &compatible
  finish
else
  let g:loaded_jm_settings = 1
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set colorcolumn=80
set complete-=i
set cursorline
set display+=lastline
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set nocompatible
set noerrorbells
set nrformats-=octal
set number
set ruler
set scrolloff=1
set sessionoptions-=options
set shiftround
set shiftwidth=2
set showmatch
set sidescrolloff=5
set smartcase
set smarttab
set tabstop=2
set ttimeout
set ttimeoutlen=100
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000
set visualbell
set wildmenu

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap//

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
set grepformat=%f:%l:%c:%m

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if !empty(&viminfo)
  set viminfo^=!
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Netrw settings no banner, tree view, open new file in old tab
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

if exists('$TMUX')
  set norelativenumber
else
  set relativenumber
endif
