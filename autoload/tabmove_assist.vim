" Assist to move the tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

if exists('g:loaded_tabmove_assist')
  finish
endif
let g:loaded_tabmove_assist = 1

let s:cpo_save = &cpo
set cpo&vim

function! tabmove_assist#shift()
  if winnr('$') == 1
    return 0
  endif

  let current_line_number = line('.')

  tabedit %
  tabp | hide | tabn | execute current_line_number
endfunction

function! tabmove_assist#move(num)
  let dist_tab_number = a:num - 1
  execute 'tabmove '.dist_tab_number
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
