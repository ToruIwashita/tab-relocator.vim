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
  let org_tab_number = tabpagenr()
  execute 'tabedit %'
  let dist_tab_number = tabpagenr()
  execute 'tabnext '.org_tab_number
  hide
  execute 'tabnext '.dist_tab_number
endfunction

function! tabmove_assist#move(num)
  if a:num <= tabpagenr()
    let dist_tab_number = a:num - 1
  else
    let dist_tab_number = a:num
  end
  execute 'tabmove '.dist_tab_number
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
