if rio#should_abort('gitcommit')
    finish
endif

" The following two are misnomers. Colors are correct.
hi! link diffFile    RioGreen
hi! link diffNewFile RioRed

hi! link diffAdded   RioGreen
hi! link diffLine    RioCyanItalic
hi! link diffRemoved RioRed

