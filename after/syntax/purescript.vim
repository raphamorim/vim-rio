if rio#should_abort('purescript')
    finish
endif

hi! link purescriptModule Type
hi! link purescriptImport RioCyan
hi! link purescriptImportAs RioCyan
hi! link purescriptOperator Operator
hi! link purescriptBacktick Operator
