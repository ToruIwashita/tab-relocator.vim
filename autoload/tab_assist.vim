" Assist to move the tab
" Author:  ToruIwashita <toru.iwashita@gmail.com>
" License: This file is placed in the public domain.

command! TShift call tab_assist#shift()

command! -nargs=1 TMove call tab_assist#move(<args>)
