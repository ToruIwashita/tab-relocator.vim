" File: autoload/tab_relocator.vim
" Author: ToruIwashita <toru.iwashita@gmail.com>
" License: MIT License

let s:cpo_save = &cpoptions
set cpoptions&vim

if !exists('g:tab_relocator_after_shift')
  let g:tab_relocator_after_shift = 'zz'
endif

function! s:after_shift()
  let l:action = g:tab_relocator_after_shift

  if match(l:action, 'zt') != -1
    return 'zt'
  elseif match(l:action, 'zb') != -1
    return 'zb'
  else
    return 'zz'
  endif
endfunction

function! tab_relocator#shift()
  if winnr('$') == 1
    return 0
  endif

  let l:current_line_num = line('.')

  tabedit %

  tabp
  hide
  tabn

  execute l:current_line_num
  execute 'normal! '.s:after_shift()
endfunction

function! tab_relocator#move(num)
  let l:current_tab_num = tabpagenr()

  if a:num < l:current_tab_num
    let l:dist_tab_num = a:num - 1
  else
    let l:dist_tab_num = a:num
  end
  execute 'tabmove '.l:dist_tab_num
endfunction

fun! tab_relocator#tab_new_at_first()
  tabnew
  call tab_relocator#move(1)
endf

fun! tab_relocator#tab_new_at_last()
  tabl
  tabnew
endf

let &cpoptions = s:cpo_save
unlet s:cpo_save
