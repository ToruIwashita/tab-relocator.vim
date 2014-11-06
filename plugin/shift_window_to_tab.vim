" Close current window, and open new tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

if exists("g:loaded_shift_window_to_tab")
  finish
endif
let g:loaded_shift_window_to_tab = 1

let s:cpo_save = &cpo
set cpo&vim

function! shift_window_to_tab#shift()
  let s:shift_window_to_tab#target_buffer = bufnr('%')
  close
  tabnew | buffer s:shift_window_to_tab#target_buffer
  unlet s:shift_window_to_tab#target_buffer
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
