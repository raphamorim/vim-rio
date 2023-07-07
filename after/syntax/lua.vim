if rio#should_abort('lua')
    finish
endif

hi! link luaFunc  RioCyan
hi! link luaTable RioFg

" tbastos/vim-lua {{{

hi! link luaBraces       RioFg
hi! link luaBuiltIn      Constant
hi! link luaDocTag       Keyword
hi! link luaErrHand      RioCyan
hi! link luaFuncArgName  RioOrangeItalic
hi! link luaFuncCall     Function
hi! link luaLocal        Keyword
hi! link luaSpecialTable Constant
hi! link luaSpecialValue RioCyan

" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
