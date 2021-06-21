" vim: foldmethod=marker

call plug#begin('/Users/epigeon/.cache/vim-plugged')

" Global {{{
Plug 'bkad/CamelCaseMotion'
Plug '/usr/local/opt/fzf'
Plug '/Users/epigeon/Documents/Projects/Vim/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Konfekt/FastFold'
Plug 'bling/vim-airline'
" Plug 'vim-syntastic/syntastic'    " Syntax checking
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align' " Simple easy to use alignment plugin
Plug 'sjl/gundo.vim'           " Visual undo
Plug 'mhinz/vim-hugefile'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'janko/vim-test'
Plug 'jgdavey/tslime.vim'
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
" }}}

" NerdTree {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tyok/nerdtree-ack', { 'on': 'NERDTreeToggle' }
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'bruno-/vim-ruby-fold'
" }}}

" JSON {{{
Plug 'elzr/vim-json'
" }}}

" YAML {{{
Plug 'avakhov/vim-yaml'
" }}}

" Go {{{
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" }}}

" Color Schemes {{{
Plug 'eric-pigeon/vim-256-color-schemes' " A variety of terminal based colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
" }}}

" Elixir {{{
Plug 'elixir-editors/vim-elixir'
" }}}

call plug#end()
