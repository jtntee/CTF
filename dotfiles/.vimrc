"vsettings 19.09.16
""--------------------------------------

set nocompatible
set number
set laststatus=2
set clipboard=unnamed
filetype off
vnoremap <C-c> "+y


"" Vundle installation
""--------------------------------------

let iHaveVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle ..."
	echo ""
	silent !mkdir -p ~./vim/bundle
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let iHaveVundle=0
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'benmills/vimux'

if iHaveVundle == 0
	echo ""Downloading Plugins ..."
	echo ""
	:PluginInstall
endif

call vundle#end()
filetype plugin indent on

"" Plugin configs
""--------------------------------------

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Keybindings
""--------------------------------------
let mapleader = ","

nnoremap <leader>rv :source $MYVIMRC<CR>

nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

map <C-n> :NERDTreeToggle<CR>
map <leader>m :call VimuxRunCommand("clear; python " . bufname("%"))<CR>

inoremap jj <Esc>


"" Color settings
""--------------------------------------

set t_Co=256
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme solarized
endif

let g:airline_powerline_fonts=1
let g:airline_theme='base16'


autocmd BufWritePre * %s/\s\+$//e
