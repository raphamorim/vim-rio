" Rio Airline Theme: {{{
""
" Code licensed under the MIT license
"
"}}}
" Helpers: {{{

" Takes a foreground color name, background color name, and optionally one or
" more attr-list items as input, transforms it to the format accepted by
" airline#themes#generate_color_map and returns that value
func! s:clr(fg, bg, ...)
  let l:fg = g:rio#palette[a:fg]
  let l:bg = g:rio#palette[a:bg]
  return [ l:fg[0], l:bg[0], l:fg[1], l:bg[1] ] +
       \ filter(copy(a:000), 'type(v:val) == 1 && len(v:val) > 0')
endfunc

" Takes three ['fg', 'bg'] color lists and optionally a dictionary of extra
" key-value pairs and returns the value generated by
" airline#themes#generate_color_map after optionally merging the dictionary of
" extra key-value pairs.
"
" a:a -> airline_a, airline_x
" a:b -> airline_b, airline_y
" a:c -> airline_c, airline_z
func! s:color_map(a, b, c, ...)
  if a:0 == 0
    return call('airline#themes#generate_color_map', [call('s:clr', a:a), call('s:clr', a:b), call('s:clr', a:c)])
  else
    return call('extend', [ call('airline#themes#generate_color_map', [call('s:clr', a:a), call('s:clr', a:b), call('s:clr', a:c)]) ] + a:000)
  endif
endfunc

"}}}

let g:airline#themes#rio#palette = {
\   'normal': s:color_map(
\       ['bg', 'purple'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'normal_modified': s:color_map(
\       ['bg', 'purple'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'insert': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'insert_modified': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'replace': s:color_map(
\       ['bg', 'orange'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'replace_modified': s:color_map(
\       ['bg', 'orange'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'visual': s:color_map(
\       ['bg', 'yellow'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'visual_modified': s:color_map(
\       ['bg', 'yellow'],
\       ['fg', 'comment'],
\       ['fg', 'bgdark'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'inactive': s:color_map(
\       ['bg', 'comment'],
\       ['fg', 'bgdark'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'terminal': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_term': s:clr('fg', 'selection'),
\       },
\     ),
\}

" Extensions: {{{
" Tabline: {{{
if get(g:, 'airline#extensions#tabline#enabled', 0)
  let g:airline#themes#rio#palette.tabline = {
        \ 'airline_tabfill': s:clr('bg', 'bglight'),
        \
        \ 'airline_tab': s:clr('comment', 'bg'),
        \ 'airline_tabsel': s:clr('bg', 'purple'),
        \ 'airline_tabmod': s:clr('green', 'bg'),
        \
        \ 'airline_tab_right': s:clr('comment', 'bg'),
        \ 'airline_tabsel_right': s:clr('fg', 'bg', ),
        \ 'airline_tabmod_right': s:clr('green', 'bg'),
        \}
endif
"}}}
" CtrlP: {{{2
if exists('g:loaded_ctrlp')
  let g:airline#themes#rio#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ s:clr('fg', 'selection'),
        \ s:clr('fg', 'comment'),
        \ s:clr('fg', 'purple'),
        \)
endif
"}}}2
"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0: