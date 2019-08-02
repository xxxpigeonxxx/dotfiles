" vim: foldmethod=marker

call plug#begin('/Users/epigeon/.cache/vim-plugged')

" Global {{{
Plug 'bkad/CamelCaseMotion'
Plug '/usr/local/opt/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Konfekt/FastFold'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'    " Syntax checking
Plug 'junegunn/vim-easy-align' " Simple easy to use alignment plugin
Plug 'sjl/gundo.vim'           " Visual undo
Plug 'mhinz/vim-hugefile'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
" }}}

" NerdTree {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tyok/nerdtree-ack', { 'on': 'NERDTreeToggle' }
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'
Plug 'bruno-/vim-ruby-fold'
" }}}

" JSON {{{
Plug 'elzr/vim-json'
" }}}

" YAML {{{
Plug 'avakhov/vim-yaml'
" }}}

" Color Schemes {{{
Plug 'eric-pigeon/vim-256-color-schemes' " A variety of terminal based colorschemes
Plug 'altercation/vim-colors-solarized'
" }}}


call plug#end()
