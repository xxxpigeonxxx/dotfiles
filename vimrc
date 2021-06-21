" Preamle ---------------------------------------------------------------------- {{{
" Use Vim settings, rather than vi sesstings
" This must be first, because it changes other options as a side effect.
set nocompatible

" turn on pathogen vim plugin
" call pathogen#infect()

" }}}
" NeoBundle auto-installation and setup {{{1
" Install and configure NeoBundle {{{2
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))

" NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}2
" Bundles {{{2
" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
" Unite sources
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload': {'unite_sources': 'colorscheme'}}          " Allows unite to auto switch between colorschemes
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload': {'unite_sources': 'fold'}}                     " Allows unite to get a list of folds in the current buffer
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources': ['file_mru', 'directory_mru']}}   " Allows unite to create a list of mru files
NeoBundle 'kopischke/unite-spell-suggest'                                                          " Allows spell check to use the unite plugin for finding suggestions
NeoBundle 'Shougo/neocomplete.vim'                                                                 " Auto completion framework. Requires that vim be compiled with lua support
NeoBundle 'Raimondi/delimitMate'                                                                   " Auto close quotes, parens, brackets, etc
NeoBundle 'scrooloose/nerdtree'                                                                    " File tree explorer and manager
NeoBundle 'JarrodCTaylor/vim-256-color-schemes'                                                    " A variety of terminal based colorschemes
NeoBundle 'majutsushi/tagbar'                                                                      " Display tags in a buffer ordered by class
NeoBundle 'ervandew/supertab'                                                                      " Use tab for all completions
NeoBundle 'scrooloose/syntastic'                                                                   " Syntax checking
NeoBundle 'vim-scripts/UltiSnips'                                                                  " Ultimate solution for snippets
NeoBundle 'tpope/vim-commentary'                                                                   " Comment stuff out
NeoBundle 'mhinz/vim-startify'                                                                     " Fancy splash screen
NeoBundle 'JarrodCTaylor/vim-python-test-runner'                                                   " Run Python tests from Vim
NeoBundle 'tpope/vim-surround'                                                                     " Surround objects with all manor of things
NeoBundle 'bling/vim-airline'                                                                      " Pretty up the status line
NeoBundle 'sjl/gundo.vim'                                                                          " Visual undo
NeoBundle 'justinmk/vim-sneak'                                                                     " Vim motion plugin
NeoBundle 'JarrodCTaylor/vim-shell-executor'                                                       " Execute any code from within vim buffers
NeoBundle 'https://github.com/mattn/emmet-vim/'                                                    " Formally zen coding
NeoBundle 'junegunn/vim-easy-align'                                                                " Simple easy to use alignment plugin
NeoBundle 'JarrodCTaylor/vim-qunit-special-blend'                                                  " Run qunit tests
NeoBundle 'mustache/vim-mustache-handlebars'                                                       " Handlebars syntax highlighting
NeoBundle 'osyo-manga/vim-over'                                                                    " Visual find and replace
NeoBundle '2ndStopShop/vim-less'                                                                   " Syntax highlighting for less files
NeoBundle 'Yggdroot/indentLine'                                                                    " Indent guides
NeoBundle 'wellle/targets.vim'                                                                     " Provide additional text objects
NeoBundle 'tpope/vim-fireplace'                                                                    " Clojure REPL support
NeoBundle 'thinca/vim-qfreplace'                                                                   " Easy replace in the quick fix buffer
NeoBundle 'guns/vim-sexp'                                                                          " Precision editing for S-expressions
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'                                             " Make sexp usable
NeoBundle 'amdt/vim-niji'                                                                          " Rainbow parentheses
NeoBundle 'tpope/vim-dispatch'                                                                     " Asynchronous build and test dispatcher
NeoBundle 'kien/ctrlp.vim'                                                                         " Because I just can't get unit to work all the way :(
NeoBundle 'takac/vim-hardtime'                                                                     " Muhahahahaha oh their faces. I can taste their tears
NeoBundle 'JarrodCTaylor/vim-sql-suggest'                                                          " SQL auto completion
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle '~/dotfiles/vim/my-plugins/nerd-search', {'type': 'nosync'}                              " Search in a specific directory from within nerdtree
NeoBundle '~/dotfiles/vim/my-plugins/vim-grep-quickfix', {'type': 'nosync'}                        " Add grep functionality to the quickfix buffer
NeoBundle '~/dotfiles/vim/my-plugins/vim-wiki-links', {'type': 'nosync'}                           " Add the ability to link between wiki (markdown) files
" Python Plugins {{{
NeoBundleLazy 'tmhedberg/SimpylFold', {'autoload':{'filetypes':['python']}}                        " Fold Python source code
NeoBundleLazy 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}}                        " Python autocompletion
" }}}
" Javascript / CoffeeScript {{{
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}            " Improved indentation and syntax support
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['javascript','coffee']}}       " CoffeeScript support syntax, indenting, etc
NeoBundleLazy 'JarrodCTaylor/vim-js2coffee', {'autoload':{'filetypes':['javascript','coffee']}}    " Convert JS to CoffeeScript and vice versa
NeoBundleLazy 'lukaszkorecki/CoffeeTags', {'autoload':{'filetypes':['javascript','coffee']}}       " Ctags generator for CoffeScript
" }}}
" Markdown {{{
NeoBundleLazy 'nelstrom/vim-markdown-folding', {'autoload':{'filetypes':['markdown']}}             " Does what it says on the tin
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}                       " Syntax highlighting for markdown (Perhaps optional with new versions of Vim)
" }}}
" }}}2
" Auto install the plugins {{{2

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we want to install them
NeoBundleCheck
" }}}2
" }}}1
" Basic Settings --------------------------------------------------------------- {{{
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin on
filetype indent on

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
	syntax on
endif

let mapleader="\\"                                " set leader
set textwidth=0                                   " don't wrap text
set autoindent                                    " set automatic indentingset automatic indenting
set history=50                                    " keep 50 lines of command line history
set nowrap                                        " turn off line wrapping.
set showcmd                                       " displays incomplete commands
set noshowmode                                    " don't diplay mode (powerline does it better)
set backspace=indent,eol,start                    " allow backspacing over everything in insert mode
set hidden                                        " handle multiple buffers better.
set number
set relativenumber                                " display relative line numbers
set ruler                                         " show the cursor position all the time
set cursorline                                    " highlight current line
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=235 guibg=#222222
autocmd WinEnter * setlocal cursorline            " Show current line highlight when entering a window
autocmd WinLeave * setlocal nocursorline          " Remove current line highlight when leaving a window
" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>
set title                                         " change terminals title
set visualbell                                    " no beeping.
set laststatus=2                                  " show the status line all the time
set background=dark
au FocusLost * :wa                                " Automatically save files when they lose focus
au VimResized * :wincmd =                         " Resize splits when the window is resized
set pastetoggle=<f2>
set list
" set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" set listchars=tab:│┈ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:┊\ ,eol:¬,extends:❯,precedes:❮

" }}}
" Absolute/Relative Line Numbers ----------------------------------------------- {{{
function! NumberToggle()
	echo &relativenumber
	if &relativenumber == 1
		set relativenumber!
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
" }}}
" WildMenu Completion ---------------------------------------------------------- {{{
set wildmenu                                      " enhanced command line completion.
set wildmode=list:longest,list:full                " complete files like a shell.
set wildignore+=.hg,.git,.svn                     " Version control
set wildignore+=*.aux,*.out,*.toc                 " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.spl                             " compiled spelling word lists
set wildignore+=*.sw?                             " Vim swap files
set wildignore+=*.DS_Store                        " OSX bullshit
" }}}
" Line Return ------------------------------------------------------------------ {{{
augroup line_return
	au!
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	au BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
augroup end
" }}}
" Tabs ------------------------------------------------------------------------- {{{
set tabstop=2                                     " set tab size
set shiftwidth=2                                  " set how man columns text gets indented with indent operations
set noexpandtab                                   " dont auto convert tabs into spaces
" }}}
" Backups/Swap Files/Undo File ------------------------------------------------- {{{
set nobackup                                      " don't make a backup before overwritting a file.
set nowritebackup                                 " and again.
set undofile                                      " persistent undo
set undoreload=10000
set directory=$HOME/.vim/tmp/swap//               " keep swap files in one location
set undodir=$HOME/.vim/tmp/undo//                 " undo files location
set backupdir=$HOME/.vim/tmp/backup//             " backups location
" }}}
" Searching and Movement ------------------------------------------------------- {{{
set ignorecase                                    " Case-insensitive searching
set smartcase                                     " Search case-insensitive when search string is all-lowercase,
                                                  " otherwise search case-sensitive
set incsearch                                     " do incremental searching
set hlsearch                                      " highlight matches
set showmatch
set scrolloff=4                                   " Lines of context around the cursor.
set sidescroll=1
set sidescrolloff=10
set virtualedit+=block
" Highlight current word matches
autocmd CursorMoved * silent! exe printf('match SpellLocal /\<%s\>/', expand('<cword>'))
" }}}
" DiffOrig --------------------------------------------------------------------- {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
			\ | wincmd p | diffthis
endif
" }}}
" Pretty Format xml ------------------------------------------------------------ {{{
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
" }}}
" Mappings --------------------------------------------------------------------- {{{
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
" NERDTree configuration
map <Leader>n :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
" Tabs ------------------------------------------------------------------------- {{{
map <Leader>tt :tabnew<cr>
map <Leader>te :tabedit
map <Leader>tc :tabclose<cr>
map <Leader>to :tabonly<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr>
map <Leader>tf :tabfirst<cr>
map <Leader>tl :tablast<cr>
map <Leader>tm :tabmove
" }}}
" }}}
" Folding ---------------------------------------------------------------------- {{{
set foldlevelstart=0
set foldopen=insert,jump,mark,percent,tag,search

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" "Refocus" folds
nnoremap ,z zMzvzz

function! MyFoldText() " {{{
	let line = getline(v:foldstart)

	let nucolwidth = &fdc + &number * &numberwidth
	let windowwidth = winwidth(0) - nucolwidth - 3
	let foldedlinecount = v:foldend - v:foldstart

	" expand tabs into spaces
	let onetab = strpart('          ', 0, &tabstop)
	let line = substitute(line, '\t', onetab, 'g')

	let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
	let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
	return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" FileType Specific ------------------------------------------------------------ {{{
au FileType c,cpp,java,php,js set cindent
" Ruby {{{
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec set filetype=ruby
" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake         set filetype=ruby
" IRB config
au BufNewFile,BufRead .irbrc,irbrc               set filetype=ruby
" Rackup
au BufNewFile,BufRead *.ru                       set filetype=ruby
" Capistrano
au BufNewFile,BufRead Capfile                    set filetype=ruby
" Bundler
au BufNewFile,BufRead Gemfile                    set filetype=ruby
" Autotest
au BufNewFile,BufRead .autotest                  set filetype=ruby
" eRuby
au BufNewFile,BufRead *.erb,*.rhtml              set filetype=eruby
" }}}
" Vim {{{
augroup ft_vim
	au!
		au FileType vim setlocal foldmethod=marker
augroup END
" }}}
" PHP {{{
augroup ft_php
	au!
		au FileType php setlocal foldmethod=marker
augroup END
" }}}
" Javascript/Json {{{
augroup ft_javascript
	au!
	" au BufNewFile,BufRead *.js set filetype=javascript syntax=jquery
		au BufNewFile,BufRead *.json set filetype=javascript
		au FileType javascript call JavaScriptFold()
augroup end
" }}}
" Yacc {{{
augroup ft_yacc
	au!
		au BufNewfile,BufRead *ypp set filetype=yacc
augroup end
" }}}
" Bash {{{
augroup ft_bash
	au!
		au FileType sh setlocal foldmethod=marker
augroup END
" }}}
" tmux {{{
augroup ft_tmux
	au!
		au FileType tmux setlocal foldmethod=marker
augroup END
" }}}
" }}}
" Color Scheme ----------------------------------------------------------------- {{{
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized                         " Set colors
" set t_Co=256
colorscheme harlem-nights
" }}}
" Plugin Settings -------------------------------------------------------------- {{{
" Local vimrc {{{
let g:localvimrc_ask=0                        " dont ask to source local vim rcs
" }}}
" Indent Line {{{
nnoremap <Leader>ig :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '¦' "'┊'
let g:indentLine_color_term = 239
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'start*']
let g:indentLine_fileTypeExclude = ['text']
" }}}
" Vim-sneak {{{
nmap f <Plug>SneakForward
nmap F <Plug>SneakBackward
let g:sneak#streak = 1
" }}}
" }}}
" Environments (GUI/Consoloe) -------------------------------------------------- {{{
if has('gui_running')
else
	" In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
		set mouse=a
	endif
endif
" }}}
" Unused ----------------------------------------------------------------------- {{{
" For all text files set 'textwidth' to 78 characters.
" autocmd FileType text setlocal textwidth=78
" let g:Powerline_symbols='fancy'
" set nofoldenable                            " turn off automatic code folding
" }}}
