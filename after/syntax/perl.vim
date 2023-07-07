if rio#should_abort('perl')
    finish
endif

" Regex
hi! link perlMatchStartEnd       RioRed

" Builtin functions
hi! link perlOperator            RioCyan
hi! link perlStatementFiledesc   RioCyan
hi! link perlStatementFiles      RioCyan
hi! link perlStatementFlow       RioCyan
hi! link perlStatementHash       RioCyan
hi! link perlStatementIOfunc     RioCyan
hi! link perlStatementIPC        RioCyan
hi! link perlStatementList       RioCyan
hi! link perlStatementMisc       RioCyan
hi! link perlStatementNetwork    RioCyan
hi! link perlStatementNumeric    RioCyan
hi! link perlStatementProc       RioCyan
hi! link perlStatementPword      RioCyan
hi! link perlStatementRegexp     RioCyan
hi! link perlStatementScalar     RioCyan
hi! link perlStatementSocket     RioCyan
hi! link perlStatementTime       RioCyan
hi! link perlStatementVector     RioCyan

" Highlighting for quoting constructs, tied to existing option in vim-perl
if get(g:, 'perl_string_as_statement', 0)
  hi! link perlStringStartEnd RioRed
endif

" Signatures
hi! link perlSignature           RioOrangeItalic
hi! link perlSubPrototype        RioOrangeItalic

" Hash keys
hi! link perlVarSimpleMemberName RioPurple
