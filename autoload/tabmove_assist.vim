" Assist to move the tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

if exists('g:loaded_tab_assist')
  finish
endif
let g:loaded_tab_assist = 1

let s:cpo_save = &cpo
set cpo&vim

function! tab_assist#shift()
  let l:target_buffer = bufnr('%')
  close
  silent! execute 'tabnew | buffer '.l:target_buffer
  unlet l:target_buffer
endfunction

function! tab_assist#move(num)
  let l:num = a:num - 1
  silent! execute 'tabmove '.l:num
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
