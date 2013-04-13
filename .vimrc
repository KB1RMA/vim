" Vim-Pathogen
execute pathogen#infect()

"set fileencodings=ucs-bom,utf-8,default,latin1
set encoding=utf-8

" Requires patched font from
" https://github.com/eugeneching/consolas-powerline-vim
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Consolas\ 9
	else
		set guifont=Consolas\ for\ Powerline\ FixedD:h9
	endif
endif		

set shiftwidth=2
set smartindent
set tabstop=2
" set termencoding=utf-8

syntax on

set guioptions-=m  "remove menu
set guioptions-=T  "remove toolbar
set clipboard=unnamed "set copy and paste to use system buffer

set nowrap
set spell
set hlsearch
set number

colorscheme molokai

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let g:Powerline_symbols = 'fancy'

"set runtimepath^=~/.vim/bundle/ctrlp.vim

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
