if rio#should_abort('ruby')
    finish
endif

if ! exists('g:ruby_operators')
    let g:ruby_operators=1
endif

hi! link rubyBlockArgument          RioOrangeItalic
hi! link rubyBlockParameter         RioOrangeItalic
hi! link rubyCurlyBlock             RioPink
hi! link rubyGlobalVariable         RioPurple
hi! link rubyInstanceVariable       RioPurpleItalic
hi! link rubyInterpolationDelimiter RioPink
hi! link rubyRegexpDelimiter        RioRed
hi! link rubyStringDelimiter        RioYellow
