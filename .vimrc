set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" Git integration
Plugin 'tpope/vim-fugitive'
" Nerd tree
Plugin 'scrooloose/nerdtree'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Surround words with characters
Plugin 'tpope/vim-surround'
" Fuzzy searches
Plugin 'kien/ctrlp.vim'
" Code completion
" Plugin 'Valloric/YouCompleteMe' " requires Python 2.x-compiled Vim
" Code alignment
Plugin 'godlygeek/tabular'
" Tab completion
Plugin 'ervandew/supertab'
" Statusline plugin
Plugin 'powerline/powerline'
" Markdown syntax
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable syntax highlighting
syntax on

" Set color scheme to desert
colorscheme desert

" Set search highlighting
set hlsearch

" Set incremental search updates
set incsearch

" Set vim-style indenting
set cindent

" Enable line numbers. To disable, type :set nonumber.
set number
