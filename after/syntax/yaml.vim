if rio#should_abort('yaml')
    finish
endif

hi! link yamlAlias           RioGreenItalicUnderline
hi! link yamlAnchor          RioPinkItalic
hi! link yamlBlockMappingKey RioCyan
hi! link yamlFlowCollection  RioPink
hi! link yamlFlowIndicator   Delimiter
hi! link yamlNodeTag         RioPink
hi! link yamlPlainScalar     RioYellow

