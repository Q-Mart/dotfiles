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

set runtimepath^=~/.config/nvim/.vim runtimepath+=~/.config/nvim/.vim/after
let &packpath = &runtimepath

"select powerline font for gvim
if has('gui_running')
    set guifont=Fira\ Mono\ for\ Powerline\ 10
endif

"Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

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
set undodir=~/.vim/undo

"Clear search highlights
nnoremap <leader><space> :nohlsearch<CR>

"Set folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"toggle gundo
nnoremap <leader>u :MundoToggle<CR>

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


" Source a global configuration file if available
"
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"Set theme for airline
let g:airline_theme = 'term'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%*

set t_Co=256

"Spellcheck
map <F6> :setlocal spell spelllang=en_gb<cr>

"Highlight trailing whitespace and 120 character lines
augroup ErrorHiglights
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() | call matchadd('ErrorMsg', '\s\+$', 100) | call matchadd('ErrorMsg', '\%>120v.\+', 100)
augroup END

"Auto spell check and word wrapping for markdown and latex
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb tw=110
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_gb tw=110

"Colourscheme
set background=dark
colorscheme deus
filetype plugin indent on

"fzf vim mapping
nmap <C-P> :Files<CR>
nmap <C-F> :Rg<CR>
nmap <C-G> :Tags<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"grep for current word under cursor
nmap <C-L> :execute "Rg " . expand("<cword>") <CR>

let g:polyglot_initialized = 0

" COC nvim
" JSON C comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
