" -----------------------------------------------------------------------------
" File: spacebeans.vim
" Description: A really dark color scheme based on coffee and fruit colors
" Author: FinestBanana <feinstebanane@gmail.com>
" Source: https://github.com/FinestBanana/SpaceBeans
" Last Modified: 11 Mar 2026
" -----------------------------------------------------------------------------

function! spacebeans#invert_signs_toggle()
  if g:spacebeans_invert_signs == 0
    let g:spacebeans_invert_signs=1
  else
    let g:spacebeans_invert_signs=0
  endif

  colorscheme spacebeans
endfunction

" Search Highlighting {{{

function! spacebeans#hls_show()
  set hlsearch
  call SpacebeansHlsShowCursor()
endfunction

function! spacebeans#hls_hide()
  set nohlsearch
  call SpacebeansHlsHideCursor()
endfunction

function! spacebeans#hls_toggle()
  if &hlsearch
    call spacebeans#hls_hide()
  else
    call spacebeans#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
