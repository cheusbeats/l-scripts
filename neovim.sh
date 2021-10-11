#!/usr/bin/env bash
# Author: Daniil Shilo (daniilshilo-developer) <daniilshilo.developer@gmail.com>
# Description: Installs vim extensions
# Destination: This script will install required extensions for NeoVim (like plug.vim) and write some configuration in .vimrc

# Function for output messages
function message() {
	# Green bold text
	echo -e '\033[1;32m'$1'\033[0m'
}

# Installing vim-plug
message 'Installing vim-plug'
if [ ! -f '"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim' ]; then
  sudo apt install curl
	sh -c 'curl -sSfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi


message 'Installing some packages for vim-plug'
sudo apt install -y fzf nodejs npm python3-neovim neovim
# Writing configuration into $HOME/config/nvim/init.vim
message 'Writing some configuration in $HOME/config/nvim/init.vim'
mkdir -p $HOME/.config/nvim
cat <<EOF >$HOME/.config/nvim/init.vim
" # Plugins
call plug#begin('~/.config/nvim/plugged')
	" Conquer of Completion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" NERDTree file explorer
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	" FuzzyFinder (for quick search for files in project)
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	" Snippets for everything
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
	" Some language support
	Plug 'sheerun/vim-polyglot'
	" New moon theme
	Plug 'taniarascia/new-moon.vim'
	" Double quotes plugin
	Plug 'jiangmiao/auto-pairs'
	" Rainbow parenthesis
	Plug 'junegunn/rainbow_parentheses.vim'
call plug#end()

" # Colorscheme
silent! colorscheme new-moon

" # Numberline
" Numberline width
set numberwidth=4
" Hybrid number column (Absolute and relative at the same time)
set nu rnu

" # Search
" Show matches
set showmatch
" Ignore case
set ignorecase
" Search without ignoring case, when one letter is uppercase
set smartcase
" Turn on incremental search
set incsearch 
" Highlight search results
set hlsearch

" # Folding
" Folding code
set foldenable
" Enable folding at start
set foldlevelstart=10
" Maximum level of folding
set foldnestmax=10
" Folding method (based on syntax)
set foldmethod=syntax

" # Tabs
" Number of visual spaces per tab
set tabstop=2
" Number of spaces in tab, when you are in EDIT mode
set softtabstop=2
" Number of spaces for use in autoindent
set shiftwidth=2
" Soft tabs (space replaces tab character)
set expandtab
" Copy indent from current line when starting a new line 
set autoindent
" Copy indent from previous line
set copyindent

" # Keyboard shortcuts
" FZF Toggle
nnoremap <c-p> :FZF<CR>
" NERDTree
nnoremap <c-n> :NERDTreeToggle<CR>
EOF

# Install plugins
message 'Installing plugins'
nvim --headless +PlugInstall +qa
nvim --headless +'CocInstall -sync coc-json coc-htmlhint coc-css coc-emmet coc-yaml coc-snippets coc-tailwindcss coc-tsserver coc-sh' +qa
