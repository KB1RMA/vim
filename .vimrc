" Make vim more useful
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'yurifury/hexHighlight'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'hallettj/jslint.vim'
Plugin 'scrooloose/syntastic'
Plugin 'gregsexton/MatchTag'
Plugin 'docunext/closetag.vim'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" No newline at EOF for php
autocmd FileType php setlocal noeol binary fileformat=dos

" Change mapleader
let mapleader=","

"set fileencodings=ucs-bom,utf-8,default,latin1
set encoding=utf-8 nobomb

" Requires patched font from
" https://github.com/eugeneching/consolas-powerline-vim
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Consolas\ 9
	elseif has("gui_macvim")
		set guifont=Consolas:h9
	else
syntax set guifont=Consolas\ for\ Powerline\ FixedD:h9
	endif
endif

set shiftwidth=2
set tabstop=2
" set termencoding=utf-8

set guioptions-=m  "remove menu
set guioptions-=T  "remove toolbar
set clipboard=unnamed "set copy and paste to use system buffer

set nowrap
set spell
set hlsearch
set number

" Swap files in tmp
set backup
if has("win32") || has("win64")
   set directory=$TMP
   set backupdir=$TMP
else
   set directory=/tmp
   set backupdir=/tmp
end

" Settings from Paul Irish
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set foldcolumn=4 " Column to show folds
" set foldenable
set foldlevel=2
" set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=indent " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.

" Status Line
let g:Powerline_symbols = 'fancy'

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Toggle folds (<Space>)
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

" CSS Color highlighting
" autocmd FileType css scss set omnifunc=csscomplete#CompleteCSS
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Strip trailing whitespace on save
autocmd FileType c,cpp,java,php,javascript,ruby,python autocmd BufWritePre <buffer> :call StripWhitespace ()

" Use two spaces for these filetypes
autocmd FileType python,ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=4 softtabstop=4

colorscheme molokai
syntax on

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

"set runtimepath^=~/.vim/bundle/ctrlp.vim

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3

" Automatically watch for changes in .vimrc and reload
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

