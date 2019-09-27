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
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'maralla/completor.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

syntax enable
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set autoindent

set number
set laststatus=2
set cursorline
set wildmenu

"mundo
set undofile
set undodir=~/.config/nvim/mudno

"Clear search highlights
nnoremap <leader><space> :nohlsearch<CR>

"Set folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"toggle gundo
nnoremap <leader>u :MundoToggle<CR>

"toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

"split navigation with shift+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

tnoremap <silent> <A-Up> <C-\><C-n><C-w>k
tnoremap <silent> <A-Down> <C-\><C-n><C-w>j
tnoremap <silent> <A-Left> <C-\><C-n><C-w>h
tnoremap <silent> <A-Right> <C-\><C-n><C-w>l

"Resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

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

"Deoplete
let g:deoplete#enable_at_startup = 1

"Set theme for airline
let g:airline_theme = 'term'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set t_Co=256

"Add languages to completor.vim
let g:completor_python_binary = '/usr/bin/python3'
let g:completor_clang_binary = '/usr/bin/clang'

"Spellcheck
map <F6> :setlocal spell spelllang=en_gb<cr>

"Colourscheme
set background=dark
colorscheme molokai
filetype plugin indent on
