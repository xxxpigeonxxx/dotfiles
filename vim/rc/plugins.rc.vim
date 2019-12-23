" vim: foldmethod=marker

" Ack.vim {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" NerdTree {{{
  let g:NERDTreeWinSize = 40
  let g:NERDTreeShowHidden=1
  let g:NERDTreeQuitOnOpen=0
  let g:NERDTreeShowLineNumbers=1
  let g:NERDTreeChDirMode=0
  let g:NERDTreeShowBookmarks=1
  let g:NERDTreeIgnore=['\.git','\.hg','\.pyc$']
  nnoremap <Leader>nt :NERDTreeToggle<CR>
  nnoremap <Leader>no :NERDTreeFind<CR>
" }}}

" Deoplete {{{
call deoplete#enable()

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
" }}}

" FZF {{{
nnoremap [fzf] <nop>
nmap <space> [fzf]

function! s:get_ag_text()
  let text = input('Search Text: ', '')
  execute 'Ag ' .text
endfunction

nnoremap <silent> [fzf]f       :Files<cr>
nnoremap <silent> [fzf]l       :Lines<cr>
nnoremap <silent> [fzf]d       :Directories<cr>
nnoremap <silent> [fzf]b       :Buffers<cr>
nnoremap <silent> [fzf]s       :<C-u>call <SID>get_ag_text()<cr>
" nnoremap <silent> [fzf]b       :<C-u>call fzf#run({'source': map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'), 'sink': 'e', 'down': '30%', 'window': 'call FloatingFZF()'})<cr>

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

sign define Ag text=Ag
function! Test()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&nu', 0)
  call setbufvar(buf, '&rnu', 0)
  " call setbufvar(buf, '&signcolumn', 'no')
  execute "sign place 1 line=1 name=Ag buffer=".buf

  let height = 1
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)
  let row = &lines * 2 / 10

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines * 6 / 10
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)
  let row = &lines * 2 / 10

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
au FileType fzf set nonu nornu
" }}}

" test.vim {{{
let test#strategy = "tslime"
let g:test#preserve_screen = 1
map <Leader>rt :TestFile<CR>
map <Leader>rs :TestNearest<CR>
map <Leader>rl :TestLast<CR>
map <Leader>ra :TestSuite<CR>
" }}}

" tslime.vim {{{
let g:tslime_always_current_session = 1
" }}}

" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" indentLine {{{
nnoremap <Leader>ig :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '¦' "'┊'
let g:indentLine_color_term = 239
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'start*']
let g:indentLine_fileTypeExclude = ['text']
" }}}

" Gundo {{{
nnoremap <Leader>ud :GundoToggle<CR>
" }}}

" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'
" }}}
