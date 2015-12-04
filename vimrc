" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.

"loads python for nvim
if has('nvim')
    runtime! plugin/python_setup.vim
endif

"select powerline font for gvim
if has('gui_running')
    set guifont=Fira\ Mono\ for\ Powerline\ 10
endif

"Plugins
call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe'
Plug 'simnalamburt/vim-mundo'
Plug 'rking/ag.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rdnetto/YCM-Generator'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'neovimhaskell/haskell-vim'
Plug 'fatih/vim-go'

call plug#end()

syntax enable
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent

set number
set background=dark
colorscheme PaperColor
filetype plugin indent on
set laststatus=2
set cursorline
set wildmenu

" Autocomplete brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

"Clear search highlights
nnoremap <leader><space> :nohlsearch<CR>

"Set folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" open ag.vim
nnoremap <leader>a :Ag

"toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"Set theme for airline
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set t_Co=256

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"ctrl p ag integration if ag is installed
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"Map the F5 key to run the current file with its compiler/interpreter
"Python
autocmd FileType python map <F5> :! ipython %<cr>
"Haskell
autocmd FileType haskell map <F5> :! ghc %<cr>
"C
autocmd FileType c map <F5> :! gcc %<cr> 
"JavaScript
autocmd FileType javascript map <F5> :! nodejs %<cr> 
