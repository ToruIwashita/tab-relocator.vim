" Assist to move the tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

command! TabShift call tabmove_assist#shift()

command! -nargs=1 TabMove call tabmove_assist#move(<args>)
