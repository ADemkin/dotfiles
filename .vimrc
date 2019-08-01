set encoding=utf-8
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
set smarttab
set expandtab
set nojoinspaces
" language specific tabs:
autocmd FileType html setlocal ts=2 sts=2 sw=2


colorscheme monokai
" colorscheme minimalist
" colorscheme tomorrow-night-eighties
set showcmd " display incomplete command

set listchars=tab:\|\ ,trail:·
set list

" copypaste for TAB from stackoverflow
set wildmenu
set wildmode=list:longest,full
set wildignore=**/_build/*,**/tags,**/.git,**/.hypothesis

" ignore case while searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch


set gdefault " g is not required by default in :s/old/new/ command
set scrolloff=3
set backspace=indent,eol
" set nojoinspaces

" map stupid nerd tree to backslash-e
nmap tt :NERDTreeToggle<CR>

" map import script
nmap <leader>u :call UnusedImportsRemover()<CR>
nmap <leader>i :call AllImportCompl()<CR>

" relative line number enable
set relativenumber
set numberwidth=3

" save vim state on exit
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" ale settings copied from Nekolyanich
let g:ale_open_list = 1
" let g:ale_open_loclist = 0
" let g:ale_open_quickfix = 1
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_python_flake8_options = '--ignore=W191,E501'
" let g:ale_linters = {'python': ['flake8', 'pycodestyle', 'pyls']}
let g:ale_linters = {'python': ['flake8', 'pycodestyle', 'pylint', 'mypy']}
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
autocmd Filetype html setlocal ts=4 sw=4 sts=0 noexpandtab

" JS Editing
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab


set laststatus=2 " always display the status line
set visualbell " stop annoying beeping

set splitright " split to the right
set splitbelow " split to the bottom

" isort settings
let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = '<C-s>'

" abbrev
autocmd FileType python iabbrev pdb import pdb ; pdb.set_trace()<CR>pass
autocmd FileType sh iabbrev ! #!/bin/sh

" Statusline
hi User1 ctermbg=blue ctermfg=black
hi User2 ctermbg=green ctermfg=black
hi User3 ctermbg=yellow ctermfg=black
hi User4 ctermbg=red ctermfg=black
set laststatus=2
set statusline=%n\|%F%m%r%h%w%q\ %=
set statusline+=%1*%Y[%{strlen(&fenc)?&fenc:&enc},%{&ff}]
set statusline+=%2*[%l/%L]
set statusline+=%3*[%c%V:0x%B]
set statusline+=%4*%{LintStatus()}
set statusline+=%*\ %P

function! LintStatus() " it is overrided in ftplugin/python/pylint.vim
    return ""
endfunction

" Shell statusline
hi StatusLineTerm ctermbg=black ctermfg=grey guibg=grey guifg=black
hi StatusLineTermNC ctermbg=black ctermfg=grey guibg=grey guifg=black


set titleold = ""

" Jedi setting
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_enabled = 0  " disable completions
let g:jedi#usages_command = "<leader>n"
" let g:jedi#use_splits_not_buffers = "top" " gotodef in new split
"
" smart sort of imports
nmap ss :set lazyredraw<CR>vip:sort u<CR>:'<,'>sort i<CR>:set nolazyredraw<CR>

nmap tn :tabnext<CR>
nmap tb :tabprevious<CR>
nmap gu :GitGutterUndoHunk<CR>
nmap gn :GitGutterNextHunk<CR>
nmap gp :GitGutterPrevHunk<CR>
nmap gd :Gdiff<CR>
nmap ter :tabnew ~/.vimrc<CR>
nmap src :source ~/.vimrc<CR>
nmap tz :term zsh<CR>

" undo dir
set undodir=~/.vim/undo

" extend 8 colors for color plugin
let g:mwDefaultHighlightingPalette = 'extended'

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
