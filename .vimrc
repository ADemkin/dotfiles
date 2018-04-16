syntax on
set number
set ruler
"set cursorline
set colorcolumn=80

filetype on
filetype indent on
filetype plugin on
set nocompatible

let &t_Co=256

set autoindent
set tabstop=4
set shiftwidth=4

colorscheme monokai
" colorscheme tomorrow-night-eighties
set showcmd " display incomplete command

set listchars=tab:\|\ ,trail:·
set list

" copypaste for TAB from stackoverflow
set wildmenu
set wildmode=list:longest,full

" ignore case while searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch


set gdefault " g is not required by default in :s/old/new/ command
set scrolloff=3
set backspace=indent,eol
set nojoinspaces

" map stupid nerd tree to backslash-e
nmap <leader>e :NERDTreeToggle<CR>

" map import script
nmap <leader>i :call AllImportCompl()<CR>

" relative line number enable
set relativenumber

" save vim state on exit
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" ale settings copied from Nekolyanich
let g:ale_open_list = 1
" let g:ale_open_loclist = 0
" let g:ale_open_quickfix = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
let g:ale_python_flake8_options = '--ignore=W191,E501'
let g:ale_linters = {'python': ['flake8', 'pycodestyle', 'pyls']}
let g:ale_python_pycodestyle_options = '--ignore=E501'
nmap <leader>l :ALEToggle<CR>

" set lint check delay after last edit
let g:ale_lint_delay = 5000

" ale warning signs
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'

" clear screen form search and mark
map <C-l> :nohlsearch<CR>:MarkClear<CR>

" some config features from 
" https://github.com/colbycheeze/dotfiles/blob/master/vimrc
set backspace=2   " Backspace deletes like most programs in insert mode


"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

"HTML Editing
set matchpairs+=<:>


set laststatus=2 " always display the status line
set visualbell " stop annoying beeping

set splitright " split to the right
set splitbelow " split to the bottom

" let vim save swap and backup files in special directory
" let backup_dir=expand("~/.vimbackup")
" if !isdirectory(backup_dir) && exists('*mkdir')
" 	call mkdir(backup_dir)
" endif
" let &undodir=backup_dir
" set backup
" let &backupdir=backup_dir

" let swap_dir=expand("~/.swapfiles")
" if !isdirectory(swap_dir) && exists('*mkdir')
" 	call mkdir(swap_dir)
" endif
" if isdirectory(swap_dir)
" 	let &directory=swap_dir.'/'
" endif

" isort settings
let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = '<C-s>'
