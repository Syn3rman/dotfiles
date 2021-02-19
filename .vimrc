set ignorecase
set number relativenumber
set showmatch
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
" hi Normal guibg=NONE ctermbg=NONE
" let t:is_transparent = 0 
set incsearch
"sane splitting, new split opens below and to right
set splitbelow
set splitright
"Spell correction in md
autocmd FileType markdown setlocal spell spelllang=en_gb
"Use ctrl j,k to scroll up and down smoothly
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>
"Switch between buffers with leader+b, number
:nnoremap <Leader>b :buffers<CR>:buffer<Space>
"map alt key
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"
execute "set <M-h>=\eh"

vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u

"Switch between  tabs using leader + arrow key
map <leader><up> :tabr<cr>
map <leader><down> :tabl<cr>
map <leader><left> :tabp<cr>
map <leader><right> :tabn<cr>

" set bg=dark
"Plugins
call plug#begin()
	Plug 'preservim/nerdtree'
	"Plugin nerdtree
	let NERDTreeIgnore=['__pycache__', '\.pyc$', '\.o$', '\.swp', '*\.swp', 'node_modules/']
	let NERDTreeShowHidden=1
	let NERDTreeQuitOnOpen = 1
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	nnoremap <C-n> :NERDTreeToggle<CR>

	Plug 'junegunn/fzf', { 'do':  { -> fzf#install()}}
	Plug 'junegunn/fzf.vim'
	nnoremap <silent> <Leader>f :Rg<CR>
	nnoremap <silent> <C-f> :Files<CR>

	"Easy align lets you align your code to make it more readable
	Plug 'junegunn/vim-easy-align'
	
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

	"Plugin autopairs
	Plug 'jiangmiao/auto-pairs'

	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
	let g:go_auto_type_info = 1   
	
	"Polyglot, multiple language support
	Plug 'sheerun/vim-polyglot'

	"YouCompleteMe, code completion and inline docs 
	 function! BuildYCM(info)
	           if a:info.status == 'installed' || a:info.force
	              !./install.py
	           endif
	         endfunction
	Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
	let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
	nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
	nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
	nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
	
	"Git related stuff: fugitive and gutter
	Plug 'tpope/vim-fugitive'

	"Undotree
	Plug 'mbbill/undotree'

	"Commentry
	Plug 'tpope/vim-commentary'

	set nobackup
	set noswapfile
	set nowritebackup
	set undolevels=10000         " use many levels of undo
	set history=10000    " After nocompatible

	if has('persistent_undo')
			set undodir=$HOME/.vim/undo
			set undofile 
	endif 
	:nnoremap <leader>; :UndotreeToggle<CR>

	Plug 'airblade/vim-gitgutter'
		set signcolumn=yes
		let g:gitgutter_sign_added = '+'
		let g:gitgutter_sign_modified = '*'
		let g:gitgutter_sign_removed = '-'
		let g:gitgutter_sign_removed_first_line = '-'
		let g:gitgutter_sign_modified_removed = '-' 

	Plug 'dylanaraps/wal.vim'

	"Airline
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		let g:airline_powerline_fonts = 1
		let g:airline_theme='kolor'
		if !exists('g:airline_symbols')
		    let g:airline_symbols = {}
		endif

	"**********Easy navigation between tmux and vim
	Plug 'christoomey/vim-tmux-navigator'
		let g:tmux_navigator_no_mappings = 1
		nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
		nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
		nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
		nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

	Plug 'godlygeek/tabular'

call plug#end()
colorscheme codedark
