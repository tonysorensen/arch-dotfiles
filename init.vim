set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set noruler
set wildmenu
set title
set autoindent
set smartindent
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set number relativenumber
set nohlsearch
set hidden
set noerrorbells
set wrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set termguicolors
" Gives more space at bottom for messages
set cmdheight=3


call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'frazrepo/vim-rainbow'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

let mapleader = " "
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Leader-v for `version control` :)
nnoremap <leader>v :UndotreeToggle<CR>  

let g:ale_fixers = {
            \'html': ['prettier'],
            \'css': ['prettier'],
            \}
let g:ale_linters ={
            \'html':['tidy'],
            \'css':['prettier'],
            \}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif



nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
"Ignores node modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
colorscheme onedark
highlight Normal guibg=none

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_theme='base16_gruvbox_dark_hard'
function GuiTabLabel()
	  let label = ''
	  let bufnrlist = tabpagebuflist(v:lnum)

	  " Add '+' if one of the buffers in the tab page is modified
	  for bufnr in bufnrlist
	    if getbufvar(bufnr, "&modified")
	      let label = '+'
	      break
	    endif
	  endfor

	  " Append the number of windows in the tab page if more than one
	  let wincount = tabpagewinnr(v:lnum, '$')
	  if wincount > 1
	    let label .= wincount
	  endif
	  if label != ''
	    let label .= ' '
	  endif

	  " Append the buffer name
	  return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
	endfunction

	set guitablabel=%{GuiTabLabel()}
