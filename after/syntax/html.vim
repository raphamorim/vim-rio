if rio#should_abort('html')
    finish
endif

hi! link htmlTag         RioFg
hi! link htmlArg         RioGreenItalic
hi! link htmlTitle       RioFg
hi! link htmlH1          RioFg
hi! link htmlSpecialChar RioPurple
