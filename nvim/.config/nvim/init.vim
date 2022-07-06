set termguicolors
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set number
set relativenumber
set cursorline
set mouse=ar
set colorcolumn=80
set clipboard+=unnamedplus

set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

set fillchars+=vert:\
hi SpellBad cterm=underline
hi SpellLocal cterm=underline
hi SpellRare cterm=underline
hi SpellCap cterm=underline
set spelllang=en_ca

let mapleader = " "

if system('pgrep "herbstluftwm"')
	colorscheme pywal
endif

lua require('impatient')
lua require('plugins')
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
augroup END

lua require('init')

" Neovide
let g:neovide_cursor_vfx_mode="pixiedust"
let g:neovide_refresh_rate=100
let g:neovide_transparency=0.75
highlight Normal guibg=none
highlight NonText guibg=none
set guifont=Monospace:h18

" Firenvim
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
	\ '^https?://[^/]*youtu\.?be[^/]*/': {
        	\ 'selector': '#contenteditable-root',
		\ 'takeover': 'always',
        \ },
    \ },
\ }

let g:colors_name = 'pywal'
