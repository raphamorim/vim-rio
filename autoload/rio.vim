" Palette: {{{

let g:rio#palette           = {}
let g:rio#palette.fg        = ['#F9F4DA', 253]

let g:rio#palette.bglighter = ['#424450', 238]
let g:rio#palette.bglight   = ['#343746', 237]
let g:rio#palette.bg        = ['#0F0D0E', 236]
let g:rio#palette.bgdark    = ['#21222C', 235]
let g:rio#palette.bgdarker  = ['#191A21', 234]

let g:rio#palette.comment   = ['#FCBA28',  61]
let g:rio#palette.selection = ['#7B5EA7', 239]
let g:rio#palette.subtle    = ['#ADA8A0', 238]

let g:rio#palette.cyan      = ['#88DAF2', 117]
let g:rio#palette.green     = ['#098749',  84]
let g:rio#palette.orange    = ['#FFB86C', 215]
let g:rio#palette.pink      = ['#F38BA3', 212]
let g:rio#palette.purple    = ['#7B5EA7', 141]
let g:rio#palette.red       = ['#ED203D', 203]
let g:rio#palette.yellow    = ['#FCBA28', 228]

"
" ANSI
"
let g:rio#palette.color_0  = '#4C4345'
let g:rio#palette.color_1  = '#ED203D'
let g:rio#palette.color_2  = '#098749'
let g:rio#palette.color_3  = '#FCBA28'
let g:rio#palette.color_4  = '#7B5EA7'
let g:rio#palette.color_5  = '#12B5E5'
let g:rio#palette.color_6  = '#88DAF2'
let g:rio#palette.color_7  = '#F9F4DA'
let g:rio#palette.color_8  = '#6272A4'
let g:rio#palette.color_9  = '#F38BA3'
let g:rio#palette.color_10 = '#69FF94'
let g:rio#palette.color_11 = '#FFFFA5'
let g:rio#palette.color_12 = '#D6ACFF'
let g:rio#palette.color_13 = '#FF92DF'
let g:rio#palette.color_14 = '#A4FFFF'
let g:rio#palette.color_15 = '#FFFFFF'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! rio#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'rio'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
