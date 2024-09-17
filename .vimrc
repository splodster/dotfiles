call plug#begin('~/.vim/plugged')
" LSP plugins + autocomplete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-scripts/autocomplpop'
Plug 'oranget/vim-csharp'
Plug 'ervandew/supertab'

" theme
Plug 'rose-pine/vim'
"status bar
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'


Plug 'lervag/wiki.vim'
Plug 'lervag/lists.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()


set nocompatible
set nospell
set spelllang=en_US
set shell=alacritty
filetype indent plugin on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8
set tabstop=4
set expandtab
set invexpandtab
set autoindent	
set shiftwidth=4
set laststatus=2
set backspace=indent,eol,start
set complete+=kspell
set completeopt=menuone,longest,preview
set cursorline
set noshowmode
set shortmess+=c
set number
set relativenumber
set updatetime=1000
set background=light
colorscheme rosepine
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:markdown_fenced_languages = ["csharp=cs"]
set ttimeout
set ttimeoutlen=1
set ttyfast

let mapleader = ' '
nmap <silent> <leader>ff :Files <CR>
nmap <silent> <leader>nf :Files /home/adil/wiki<CR>
 

let g:wiki_root='~/wiki'
"let g:mkdp_markdown_css = '/home/adil/style.css'
"let g:mkdp_highlight_css = '/home/adil/highlight.css'


let g:lightline = {
		\ 'colorscheme': 'rosepine',
		\ 'mode_map': {
		\ 'n' : ' NORMAL',
		\ 'i' : ' INSERT',
		\ 'R' : ' REPLACE',
		\ 'v' : ' VISUAL',
		\ 'c' : ' COMMAND',
		\ "\<C-v>": ' VISUAL_BLOCK',
		\ },
		\ 'active': {
		\ 	'left': [ [ 'mode', 'paste' ], 
		\ 			  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
		\  'right': [ [ 'lineinfo' ],
		\ 	   	      [ 'percent' ],
		\             [ 'fileformat', 'fileencoding', 'filetype' ]]
		\ },
		\ 'component_function': {
		\ 'gitbranch': 'FugitiveHead'
		\ },
		\}

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator


if executable('clangd')
    augroup User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['cpp'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


let g:vimtex_view_method = 'zathura'
let g:tex_flavor='latex'
let g:tex_conceal= 'abdmg'
let g:vimtex_compiler_method = 'latexmk'


set conceallevel=2
let g:tex_conceal="abdmgs" 
let g:vim_markdown_conceal = 1
let g:vim_markdown_folding_disabled = 1
let g:wiki_tag_list = {
	          \ 'output' : 'loclist',
			  \}
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 0
let g:mkdp_combine_preview = 1
let g:mkdp_combine_preview_auto_refresh = 1


let g:wiki_export = {
	  \ 'args' : '',
	  \ 'from_format' : 'markdown',
	  \ 'ext' : 'pdf',
	  \ 'link_ext_replace': v:false,
	  \ 'view' : v:false,
	  \ 'output': '/home/adil/wiki/',
	  \}
