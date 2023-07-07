if rio#should_abort('rst')
    finish
endif

hi! link rstComment                             Comment
hi! link rstTransition                          Comment
hi! link rstCodeBlock                           RioGreen
hi! link rstInlineLiteral                       RioGreen
hi! link rstLiteralBlock                        RioGreen
hi! link rstQuotedLiteralBlock                  RioGreen
hi! link rstStandaloneHyperlink                 RioLink
hi! link rstStrongEmphasis                      RioOrangeBold
hi! link rstSections                            RioPurpleBold
hi! link rstEmphasis                            RioYellowItalic
hi! link rstDirective                           Keyword
hi! link rstSubstitutionDefinition              Keyword
hi! link rstCitation                            String
hi! link rstExDirective                         String
hi! link rstFootnote                            String
hi! link rstCitationReference                   Tag
hi! link rstFootnoteReference                   Tag
hi! link rstHyperLinkReference                  Tag
hi! link rstHyperlinkTarget                     Tag
hi! link rstInlineInternalTargets               Tag
hi! link rstInterpretedTextOrHyperlinkReference Tag
hi! link rstTodo                                Todo
