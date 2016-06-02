" File: plugin/tabmove_assist.vim
" Author: Toru Hoyano <toru.iwashita@gmail.com>
" License: MIT License

if exists('g:loaded_tabmove_assist')
  finish
endif
let g:loaded_tabmove_assist = 1

let s:cpo_save = &cpo
set cpo&vim

command! TabShift call tabmove_assist#shift()
command! -nargs=1 TabMove call tabmove_assist#move(<args>)

let &cpo = s:cpo_save
unlet s:cpo_save
