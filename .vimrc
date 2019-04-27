" General {{{

" change swap directory
set directory=~/.vim/tmp

" enable to edit multiple files
set hidden

" hide mouse cursor when typing
set mousehide

" confirm to save
set confirm

" encoding
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set fenc=utf-8
set encoding=utf-8

" file formats
set fileformats=unix,dos,mac
set fileformat=unix

" command completion mode
set wildmode=list:longest

" move to other line
set whichwrap=h,l,<,>,[,],b,s

" delete character by backspace
set backspace=indent,eol,start

" yank to clipboard
if has("clipboard")
	set clipboard=unnamed
	if has("unnamedplus")  " X11 support
		set clipboard+=unnamedplus
	endif
endif

" cancel keymap
" - close quickfix window
" - clear highlighting
nnoremap <silent> <Esc><Esc> :ccl<CR>:lcl<CR>:nohlsearch<CR>

" Indent {{{

" auto indent
set autoindent
set cindent
set smartindent

" use soft tab
set expandtab

" tab width
set tabstop=2
set shiftwidth=2
set softtabstop=2

" fix tab width
set shiftround

" indent visual selected code
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

" }}}


" Search {{{

" highlight search
set hlsearch

" incremental search
set incsearch

" non case sensitive
set ignorecase
set smartcase

" be centering with search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" }}}


" Syntax {{{

" enable syntax highlighting
syntax on

" enable HTML tag highlighting
set matchpairs+=<:>

" set max columns
set synmaxcol=240
" }}}


" Folding {{{

set foldenable
set foldmethod=marker
set foldcolumn=0

" }}}


" }}}


" Appearance {{{

" don't redraw during editing
set lazyredraw

" show filename in the terminal caption
set title

" hide default statusline
set noshowmode

" disable all bells
set noerrorbells visualbell t_vb=

" color scheme
set t_Co=256
colorscheme molokai

" show special characters
set list
set listchars=tab:»-,eol:↲,trail:⌴,extends:»,precedes:«,nbsp:⌴
set fillchars=vert:║
set showbreak=↪

" status line
set laststatus=2
set showmode
set ruler

" show number
set number
set relativenumber
autocmd InsertEnter * :set relativenumber!
autocmd InsertLeave * :set relativenumber

" set scroll margin
set scrolloff=5
set sidescrolloff=20

" show cursor position
set cursorline
set cursorcolumn

" wrap line
set wrap
set linebreak
set breakindent
set breakindentopt=min:20,shift:0,sbr

" show max width guild
set textwidth=0
set colorcolumn=81

" show long line as much as possible
set display+=lastline

" show non-printable characters as hex
set display+=uhex

" }}}


" Key Mapping {{{

" change <leader> key
let mapleader = " "

" save with sudo
cnoremap w!!<CR> w !sudo tee % > /dev/null<CR>

" Move to edge
noremap H ^
noremap L $
vnoremap L g_

" }}}


" Packages {{{

packloadall
silent! helptags ALL


" ale {{{

let g:ale_completion_enabled = 1
let g:ale_ruby_rails_best_practices_executable = ''

" }}}


" lightline {{{

let g:lightline = {
  \ 'component': {'readonly': '%{&readonly?"\u2b64":""}',},
  \}

" }}}


" detectindent {{{

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:detectindent_max_lines_to_analyse = 1024
let g:detectindent_preferred_when_mixed = 1

"}}}

" vim-go {{{

filetype plugin indent on
autocmd FileType go nnoremap <silent> <leader>gd <C-W>v:GoDef<CR>
autocmd FileType go nnoremap <silent> <leader>gc :GoCoverageToggle<CR>
autocmd FileType go nnoremap <silent> <leader>gi :GoImports<CR>
autocmd FileType go nnoremap <silent> <leader>gl :GoMetaLinter<CR>
autocmd FileType go nnoremap <silent> <Esc><Esc> :ccl<CR>:lcl<CR>:nohlsearch<CR>:GoCoverageClear<CR>

" }}}

" vim-terraform {{{

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
autocmd BufWritePre *.tf TerraformFmt

" }}}

" vim-prettier {{{

let g:prettier#autoformat = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'all'

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue,*.html PrettierAsync
nnoremap <silent> <leader>p :Prettier<CR>

" }}}

" }}}
