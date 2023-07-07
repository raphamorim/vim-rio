" Rio Theme: {{{
"
" https://github.com/raphamorim/vim-rio
"
" Copyright 2023, All rights reserved
"
" Code licensed under the MIT license
scriptencoding utf8
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'rio'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = g:rio#palette.fg

let s:bglighter = g:rio#palette.bglighter
let s:bglight   = g:rio#palette.bglight
let s:bg        = g:rio#palette.bg
let s:bgdark    = g:rio#palette.bgdark
let s:bgdarker  = g:rio#palette.bgdarker

let s:comment   = g:rio#palette.comment
let s:selection = g:rio#palette.selection
let s:subtle    = g:rio#palette.subtle

let s:cyan      = g:rio#palette.cyan
let s:green     = g:rio#palette.green
let s:orange    = g:rio#palette.orange
let s:pink      = g:rio#palette.pink
let s:purple    = g:rio#palette.purple
let s:red       = g:rio#palette.red
let s:yellow    = g:rio#palette.yellow

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:rio#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:rio#palette['color_' . s:i])
  endfor
endif

" }}}2
" User Configuration: {{{2

if !exists('g:rio_bold')
  let g:rio_bold = 1
endif

if !exists('g:rio_italic')
  let g:rio_italic = 1
endif

if !exists('g:rio_underline')
  let g:rio_underline = 1
endif

if !exists('g:rio_undercurl')
  let g:rio_undercurl = g:rio_underline
endif

if !exists('g:rio_full_special_attrs_support')
  let g:rio_full_special_attrs_support = has('gui_running')
endif

if !exists('g:rio_inverse')
  let g:rio_inverse = 1
endif

if !exists('g:rio_colorterm')
  let g:rio_colorterm = 1
endif

if !exists('g:rio_high_contrast_diff')
  let g:rio_high_contrast_diff = 0
endif

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': g:rio_bold == 1 ? 'bold' : 0,
      \ 'italic': g:rio_italic == 1 ? 'italic' : 0,
      \ 'underline': g:rio_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:rio_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:rio_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " If the UI does not have full support for special attributes (like underline and
  " undercurl) and the highlight does not explicitly set the foreground color,
  " make the foreground the same as the attribute color to ensure the user will
  " get some highlight if the attribute is not supported. The default behavior
  " is to assume that terminals do not have full support, but the user can set
  " the global variable `g:rio_full_special_attrs_support` explicitly if the
  " default behavior is not desirable.
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !g:rio_full_special_attrs_support
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" Rio Highlight Groups: {{{2

call s:h('RioBgLight', s:none, s:bglight)
call s:h('RioBgLighter', s:none, s:bglighter)
call s:h('RioBgDark', s:none, s:bgdark)
call s:h('RioBgDarker', s:none, s:bgdarker)

call s:h('RioFg', s:fg)
call s:h('RioFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('RioFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('RioComment', s:comment)
call s:h('RioCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('RioSelection', s:none, s:selection)

call s:h('RioSubtle', s:subtle)

call s:h('RioCyan', s:cyan)
call s:h('RioCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('RioGreen', s:green)
call s:h('RioGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('RioGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('RioGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('RioOrange', s:orange)
call s:h('RioOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('RioOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('RioOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('RioOrangeInverse', s:bg, s:orange)

call s:h('RioPink', s:pink)
call s:h('RioPinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('RioPurple', s:purple)
call s:h('RioPurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('RioPurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('RioRed', s:red)
call s:h('RioRedInverse', s:fg, s:red)

call s:h('RioYellow', s:yellow)
call s:h('RioYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('RioError', s:red, s:none, [], s:red)

call s:h('RioErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('RioWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('RioInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('RioTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('RioSearch', s:green, s:none, [s:attrs.inverse])
call s:h('RioBoundary', s:comment, s:bgdark)
call s:h('RioWinSeparator', s:comment, s:bgdark)
call s:h('RioLink', s:cyan, s:none, [s:attrs.underline])

if g:rio_high_contrast_diff
  call s:h('RioDiffChange', s:yellow, s:purple)
  call s:h('RioDiffDelete', s:bgdark, s:red)
else
  call s:h('RioDiffChange', s:orange, s:none)
  call s:h('RioDiffDelete', s:red, s:bgdark)
endif

call s:h('RioDiffText', s:bg, s:orange)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:rio_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  RioBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr RioYellow
hi! link DiffAdd      RioGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   RioDiffChange
hi! link DiffDelete   RioDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     RioDiffText
hi! link Directory    RioPurpleBold
hi! link ErrorMsg     RioRedInverse
hi! link FoldColumn   RioSubtle
hi! link Folded       RioBoundary
hi! link IncSearch    RioOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      RioFgBold
hi! link NonText      RioSubtle
hi! link Pmenu        RioBgDark
hi! link PmenuSbar    RioBgDark
hi! link PmenuSel     RioSelection
hi! link PmenuThumb   RioSelection
hi! link Question     RioFgBold
hi! link Search       RioSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      RioBoundary
hi! link TabLineFill  RioBgDark
hi! link TabLineSel   Normal
hi! link Title        RioGreenBold
hi! link VertSplit    RioWinSeparator
hi! link Visual       RioSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   RioOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey RioRed
  hi! link LspReferenceText RioSelection
  hi! link LspReferenceRead RioSelection
  hi! link LspReferenceWrite RioSelection
  " Link old 'LspDiagnosticsDefault*' hl groups
  " for backward compatibility with neovim v0.5.x
  hi! link LspDiagnosticsDefaultInformation DiagnosticInfo
  hi! link LspDiagnosticsDefaultHint DiagnosticHint
  hi! link LspDiagnosticsDefaultError DiagnosticError
  hi! link LspDiagnosticsDefaultWarning DiagnosticWarn
  hi! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  hi! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  hi! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn

  hi! link DiagnosticInfo RioCyan
  hi! link DiagnosticHint RioCyan
  hi! link DiagnosticError RioError
  hi! link DiagnosticWarn RioOrange
  hi! link DiagnosticUnderlineError RioErrorLine
  hi! link DiagnosticUnderlineHint RioInfoLine
  hi! link DiagnosticUnderlineInfo RioInfoLine
  hi! link DiagnosticUnderlineWarn RioWarnLine

  hi! link WinSeparator RioWinSeparator
else
  hi! link SpecialKey RioPink
endif

hi! link Comment RioComment
hi! link Underlined RioFgUnderline
hi! link Todo RioTodo

hi! link Error RioError
hi! link SpellBad RioErrorLine
hi! link SpellLocal RioWarnLine
hi! link SpellCap RioInfoLine
hi! link SpellRare RioInfoLine

hi! link Constant RioPurple
hi! link String RioYellow
hi! link Character RioPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier RioFg
hi! link Function RioGreen

hi! link Statement RioPink
hi! link Conditional RioPink
hi! link Repeat RioPink
hi! link Label RioPink
hi! link Operator RioPink
hi! link Keyword RioPink
hi! link Exception RioPink

hi! link PreProc RioPink
hi! link Include RioPink
hi! link Define RioPink
hi! link Macro RioPink
hi! link PreCondit RioPink
hi! link StorageClass RioPink
hi! link Structure RioPink
hi! link Typedef RioPink

hi! link Type RioCyanItalic

hi! link Delimiter RioFg

hi! link Special RioPink
hi! link SpecialComment RioCyanItalic
hi! link Tag RioCyan
hi! link helpHyperTextJump RioLink
hi! link helpCommand RioPurple
hi! link helpExample RioGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0 et:
