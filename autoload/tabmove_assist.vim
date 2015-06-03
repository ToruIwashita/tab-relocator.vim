" Assist to move the tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

if exists('g:loaded_tabmove_assist')
  finish
endif
let g:loaded_tabmove_assist = 1

let s:cpo_save = &cpo
set cpo&vim

if !exists('g:tabmove_assist_after_shift')
  let g:tabmove_assist_after_shift = 'zz'
endif

function! s:after_shift()
  let action = g:tabmove_assist_after_shift

  if match(action, 'zt') != -1
    return 'zt'
  elseif match(action, 'zb') != -1
    return 'zb'
  else
    return 'zz'
  endif
endfunction

function! tabmove_assist#shift()
  if winnr('$') == 1
    return 0
  endif

  let current_line_number = line('.')

  tabedit %
  tabp | hide | tabn
  execute current_line_number
  execute 'normal! '.s:after_shift() 
endfunction

function! tabmove_assist#move(num)
  let dist_tab_number = a:num - 1
  execute 'tabmove '.dist_tab_number
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
