" vim: foldmethod=marker

if dein#tap('nerdtree') " {{{
  let g:NERDTreeWinSize = 40
  let g:NERDTreeShowHidden=1
  let g:NERDTreeQuitOnOpen=0
  let g:NERDTreeShowLineNumbers=1
  let g:NERDTreeChDirMode=0
  let g:NERDTreeShowBookmarks=1
  let g:NERDTreeIgnore=['\.git','\.hg','\.pyc$']
  nnoremap <Leader>nt :NERDTreeToggle<CR>
  nnoremap <Leader>no :NERDTreeFind<CR>
endif " }}}

if dein#tap('deoplete.vim') " {{{
  " <TAB>: completion.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

  inoremap <expr><C-g>       deoplete#refresh()
  inoremap <expr><C-e>       deoplete#cancel_popup()
  inoremap <silent><expr><C-l>       deoplete#complete_common_string()

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function() abort
    return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
  endfunction
endif "}}}

if dein#tap('denite.nvim') " {{{
  nnoremap [denite] <nop>
  nmap <space> [denite]

   "nnoremap <silent> [denite]<space> :<C-u>Denite -toggle -auto-resize -buffer-name=mixed file/rec:! buffer file_mru bookmark<cr><c-u>
   nnoremap <silent> [denite]f       :<C-u>Denite file/rec<cr>
   nnoremap <silent> [denite]z       :<C-u>Denite fold<cr>
   nnoremap <silent> [denite]l       :<C-u>Denite line<cr>
   nnoremap <silent> [denite]b       :<C-u>Denite buffer<cr>
endif " }}}

if dein#tap('vim-rspec') "{{{
  map <Leader>rt :call RunCurrentSpecFile()<CR>
  map <Leader>rs :call RunNearestSpec()<CR>
  map <Leader>rl :call RunLastSpec()<CR>
  map <Leader>ra :call RunAllSpecs()<CR>

  if dein#tap('tslime.vim') "{{{
    let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
    let g:tslime_always_current_session = 1
  endif " }}}
endif " }}}

if dein#tap('vim-easy-align') " {{{
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endif " }}}

if dein#tap('vim-sneak') " {{{
  nmap f <Plug>SneakForward
  nmap F <Plug>SneakBackward
  let g:sneak#streak = 1
endif " }}}

if dein#tap('indentLine') " {{{
  nnoremap <Leader>ig :IndentLinesToggle<CR>
  let g:indentLine_enabled = 0
  let g:indentLine_char = '¦' "'┊'
  let g:indentLine_color_term = 239
  let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'start*']
  let g:indentLine_fileTypeExclude = ['text']
endif " }}}

if dein#tap('gundo') " {{{
  nnoremap <Leader>ud :GundoToggle<CR>
endif " }}}

if dein#tap('vim-airline') " {{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep=' '
  let g:airline#extensions#tabline#left_alt_sep='¦'
endif " }}}
