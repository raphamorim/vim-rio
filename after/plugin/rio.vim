if rio#should_abort()
  finish
endif

" Fzf: {{{
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Search'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'RioOrange'],
    \ 'info':    ['fg', 'RioPurple'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'RioGreen'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \}
endif
"}}}
" ALE: {{{
if exists('g:ale_enabled')
  hi! link ALEError              RioErrorLine
  hi! link ALEWarning            RioWarnLine
  hi! link ALEInfo               RioInfoLine

  hi! link ALEErrorSign          RioRed
  hi! link ALEWarningSign        RioOrange
  hi! link ALEInfoSign           RioCyan

  hi! link ALEVirtualTextError   Comment
  hi! link ALEVirtualTextWarning Comment
endif
" }}}
" CtrlP: {{{
if exists('g:loaded_ctrlp')
  hi! link CtrlPMatch     IncSearch
  hi! link CtrlPBufferHid Normal
endif
" }}}
" GitGutter / gitsigns: {{{
if exists('g:loaded_gitgutter')
  hi! link GitGutterAdd    DiffAdd
  hi! link GitGutterChange DiffChange
  hi! link GitGutterDelete DiffDelete
endif
if has('nvim-0.5') && luaeval("pcall(require, 'gitsigns')")
  " https://github.com/lewis6991/gitsigns.nvim requires nvim > 0.5
  " has('nvim-0.5') checks >= 0.5, so this should be future-proof.
  hi! link GitSignsAdd      DiffAdd
  hi! link GitSignsAddLn    DiffAdd
  hi! link GitSignsAddNr    DiffAdd
  hi! link GitSignsChange   DiffChange
  hi! link GitSignsChangeLn DiffChange
  hi! link GitSignsChangeNr DiffChange

  hi! link GitSignsDelete   RioRed
  hi! link GitSignsDeleteLn RioRed
  hi! link GitSignsDeleteNr RioRed
endif
" }}}
" Tree-sitter: {{{
" The nvim-treesitter library defines many global highlight groups that are
" linked to the regular vim syntax highlight groups. We only need to redefine
" those highlight groups when the defaults do not match the rio
" specification.
" https://github.com/nvim-treesitter/nvim-treesitter/blob/master/plugin/nvim-treesitter.vim
if exists('g:loaded_nvim_treesitter')
  " deprecated TS* highlight groups
  " see https://github.com/nvim-treesitter/nvim-treesitter/pull/3656
  " # Misc
  hi! link TSPunctSpecial Special
  " # Constants
  hi! link TSConstMacro Macro
  hi! link TSStringEscape Character
  hi! link TSSymbol RioPurple
  hi! link TSAnnotation RioYellow
  hi! link TSAttribute RioGreenItalic
  " # Functions
  hi! link TSFuncBuiltin RioCyan
  hi! link TSFuncMacro Function
  hi! link TSParameter RioOrangeItalic
  hi! link TSParameterReference RioOrange
  hi! link TSField RioOrange
  hi! link TSConstructor RioCyan
  " # Keywords
  hi! link TSLabel RioPurpleItalic
  " # Variable
  hi! link TSVariableBuiltin RioPurpleItalic
  " # Text
  hi! link TSStrong RioFgBold
  hi! link TSEmphasis RioFg
  hi! link TSUnderline Underlined
  hi! link TSTitle RioYellow
  hi! link TSLiteral RioYellow
  hi! link TSURI RioYellow
  " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
  " which in turn links to Identifer (white).
  hi! link TSTagAttribute RioGreenItalic

  if has('nvim-0.8.1')
    " # Misc
    hi! link @punctuation.delimiter Delimiter
    hi! link @punctuation.bracket RioFg
    hi! link @punctuation.special Special
    " # Constants
    hi! link @constant Constant
    hi! link @constant.builtin Constant
    hi! link @constant.macro Macro
    hi! link @string.regex String
    hi! link @string.escape Character
    hi! link @symbol RioPurple
    hi! link @annotation RioYellow
    hi! link @attribute RioGreenItalic
    hi! link @namespace Structure
    " # Functions
    hi! link @function.builtin RioCyan
    hi! link @funcion.macro Function
    hi! link @parameter RioOrangeItalic
    hi! link @parameter.reference RioOrange
    hi! link @field RioOrange
    hi! link @property RioFg
    hi! link @constructor RioCyan
    " # Keywords
    hi! link @label RioPurpleItalic
    hi! link @keyword.function RioPink
    hi! link @keyword.operator Operator
    hi! link @exception RioPurple
    " # Variable
    hi! link @variable RioFg
    hi! link @variable.builtin RioPurpleItalic
    " # Text
    hi! link @text RioFg
    hi! link @text.strong RioFgBold
    hi! link @text.emphasis RioFg
    hi! link @text.underline Underlined
    hi! link @text.title RioYellow
    hi! link @text.literal RioYellow
    hi! link @text.uri RioYellow
    hi! link @text.diff.add DiffAdd
    hi! link @text.diff.delete DiffDelete
    " # Tags
    hi! link @tag RioCyan
    hi! link @tag.delimiter RioFg
    " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
    " which in turn links to Identifer (white).
    hi! link @tag.attribute RioGreenItalic
  endif
endif
" }}}
" nvim-cmp: {{{
" A completion engine plugin for neovim written in Lua.
" https://github.com/hrsh7th/nvim-cmp
if exists('g:loaded_cmp')
  hi! link CmpItemAbbrDeprecated RioError

  hi! link CmpItemAbbrMatch RioCyan
  hi! link CmpItemAbbrMatchFuzzy RioCyan

  hi! link CmpItemKindText RioFg
  hi! link CmpItemKindMethod Function
  hi! link CmpItemKindFunction Function
  hi! link CmpItemKindConstructor RioCyan
  hi! link CmpItemKindField RioOrange
  hi! link CmpItemKindVariable RioPurpleItalic
  hi! link CmpItemKindClass RioCyan
  hi! link CmpItemKindInterface RioCyan
  hi! link CmpItemKindModule RioYellow
  hi! link CmpItemKindProperty RioPink
  hi! link CmpItemKindUnit RioFg
  hi! link CmpItemKindValue RioYellow
  hi! link CmpItemKindEnum RioPink
  hi! link CmpItemKindKeyword RioPink
  hi! link CmpItemKindSnippet RioFg
  hi! link CmpItemKindColor RioYellow
  hi! link CmpItemKindFile RioYellow
  hi! link CmpItemKindReference RioOrange
  hi! link CmpItemKindFolder RioYellow
  hi! link CmpItemKindEnumMember RioPurple
  hi! link CmpItemKindConstant RioPurple
  hi! link CmpItemKindStruct RioPink
  hi! link CmpItemKindEvent RioFg
  hi! link CmpItemKindOperator RioPink
  hi! link CmpItemKindTypeParameter RioCyan

  hi! link CmpItemMenu Comment
endif
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
