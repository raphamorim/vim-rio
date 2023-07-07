if rio#should_abort('javascript', 'javascriptreact', 'javascript.jsx')
  finish
endif

hi! link javaScriptBraces   Delimiter
hi! link javaScriptNumber   Constant
hi! link javaScriptNull     Constant
hi! link javaScriptFunction Keyword

" pangloss/vim-javascript {{{

hi! link jsArrowFunction           Operator
hi! link jsBuiltins                RioCyan
hi! link jsClassDefinition         RioCyan
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment RioOrangeItalic
hi! link jsDocParam                RioOrangeItalic
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         RioCyan
hi! link jsFuncArgOperator         Operator
hi! link jsFuncArgs                RioOrangeItalic
hi! link jsFunction                Keyword
hi! link jsNull                    Constant
hi! link jsObjectColon             RioPink
hi! link jsSuper                   RioPurpleItalic
hi! link jsTemplateBraces          Special
hi! link jsThis                    RioPurpleItalic
hi! link jsUndefined               Constant

"}}}

" maxmellon/vim-jsx-pretty {{{

hi! link jsxTag             Keyword
hi! link jsxTagName         Keyword
hi! link jsxComponentName   Type
hi! link jsxCloseTag        Type
hi! link jsxAttrib          RioGreenItalic
hi! link jsxCloseString     Identifier
hi! link jsxOpenPunct       Identifier

" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
