if rio#should_abort('typescriptreact', 'typescript.tsx')
    finish
endif

runtime! syntax/typescript.vim

hi! link tsxAttrib           RioGreenItalic
hi! link tsxEqual            Operator
hi! link tsxIntrinsicTagName Keyword
hi! link tsxTagName          Type

" maxmellon/vim-jsx-pretty {{{

hi! link jsxTag             Keyword
hi! link jsxTagName         Keyword
hi! link jsxComponentName   Type
hi! link jsxCloseTag        Type
hi! link jsxAttrib          RioGreenItalic
hi! link jsxCloseString     Identifier
hi! link jsxOpenPunct       Identifier

" }}}
