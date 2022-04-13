set ignorecase
set number relativenumber
set showmatch
set encoding=UTF-8
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
"syntax highlighting
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
"Mouse support for sane resizing of panes
:set mouse=a
"Map kj to esc to make it easier to quit insert mode
:inoremap kj <ESC>
"Same for command mode
:cnoremap kj <ESC>
"Ctags directory
set tags+=$HOME/tags/
"set space as leader
let mapleader=' '
set incsearch
"Spell correction in md
autocmd FileType markdown setlocal spell spelllang=en_gb
"Switch between buffers with leader+b, number
:nnoremap <Leader>b :buffers<CR>:buffer<Space>
"ctrl to move between panes
nnoremap <M-J> <C-W><C-J>
nnoremap <M-K> <C-W><C-K>
nnoremap <M-L> <C-W><C-L>
nnoremap <M-H> <C-W><C-H>

"copy to system clipboard
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u

"Switch between  tabs using leader + arrow key
map <leader><up> :tabr<cr>
map <leader><down> :tabl<cr>
map <leader><left> :tabp<cr>
map <leader><right> :tabn<cr>

"open and close tabs
nnoremap <C-T> :tabnew<cr>
nnoremap <C-W> :tabclose<cr>

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do':  { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
call plug#end()

"NERDTree config
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeIgnore=['__pycache__', '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules/']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'
if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif

"tmux navigation
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
" nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
" nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
" nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

"fzf keybindings
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-f> :Files<CR>

"coc
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-go',
    \ 'coc-java',
    \ 'coc-java-vimspector',
    \]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

colorscheme codedark
