if rio#should_abort('css')
    finish
endif

hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        RioPink
hi! link cssAttributeSelector RioGreenItalic
hi! link cssBraces            Delimiter
hi! link cssFunctionComma     Delimiter
hi! link cssNoise             RioPink
hi! link cssProp              RioCyan
hi! link cssPseudoClass       RioPink
hi! link cssPseudoClassId     RioGreenItalic
hi! link cssUnitDecorators    RioPink
hi! link cssVendor            RioGreenItalic
