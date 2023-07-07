if rio#should_abort('markdown', 'mkd')
    finish
endif

if b:current_syntax ==# 'mkd'
" plasticboy/vim-markdown {{{1
  hi! link htmlBold       RioOrangeBold
  hi! link htmlBoldItalic RioOrangeBoldItalic
  hi! link htmlH1         RioPurpleBold
  hi! link htmlItalic     RioYellowItalic
  hi! link mkdBlockquote  RioYellowItalic
  hi! link mkdBold        RioOrangeBold
  hi! link mkdBoldItalic  RioOrangeBoldItalic
  hi! link mkdCode        RioGreen
  hi! link mkdCodeEnd     RioGreen
  hi! link mkdCodeStart   RioGreen
  hi! link mkdHeading     RioPurpleBold
  hi! link mkdInlineUrl   RioLink
  hi! link mkdItalic      RioYellowItalic
  hi! link mkdLink        RioPink
  hi! link mkdListItem    RioCyan
  hi! link mkdRule        RioComment
  hi! link mkdUrl         RioLink
"}}}1
elseif b:current_syntax ==# 'markdown'
" Builtin: {{{1
  hi! link markdownBlockquote        RioCyan
  hi! link markdownBold              RioOrangeBold
  hi! link markdownBoldItalic        RioOrangeBoldItalic
  hi! link markdownCodeBlock         RioGreen
  hi! link markdownCode              RioGreen
  hi! link markdownCodeDelimiter     RioGreen
  hi! link markdownH1                RioPurpleBold
  hi! link markdownH2                markdownH1
  hi! link markdownH3                markdownH1
  hi! link markdownH4                markdownH1
  hi! link markdownH5                markdownH1
  hi! link markdownH6                markdownH1
  hi! link markdownHeadingDelimiter  markdownH1
  hi! link markdownHeadingRule       markdownH1
  hi! link markdownItalic            RioYellowItalic
  hi! link markdownLinkText          RioPink
  hi! link markdownListMarker        RioCyan
  hi! link markdownOrderedListMarker RioCyan
  hi! link markdownRule              RioComment
  hi! link markdownUrl               RioLink
"}}}
endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
