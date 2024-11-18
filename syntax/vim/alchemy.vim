" Docstrings
syn region alchemyDocstring start=/\[/ end=/\]/ contains=alchemyDocType,alchemyDocDescKey
syn match alchemyDocType /\w\+:\w\+/ contained

syn keyword alchemyKeyword readb readw readd readq swap syscall1 syscall2 syscall3 syscall4 rev3 rev4 clone 2clone over do put peek poke drop sysread writeb writew writed writeq
syn keyword alchemyKeywordBlock sub marine if endif else while do wend
syn keyword alchemySpecial return next
syn match alchemyOperator "[!+\-&|><=?!]"
syn region alchemyString start='"' end='"'
syn match alchemyLibrary /\vinclude\s+\S+/
syn match alchemyDec "\<-\=[0-9]\+\.\=[0-9]*\>"
syn match alchemyHex "\<[0-9][0-9A-F]*H\>"
syn match alchemyOct "\<[0-7]\+O\>"
syn match alchemyBin "\<[01]\+B\>"

hi link alchemyKeyword Keyword
hi link alchemyOperator Keyword
hi link alchemyKeywordBlock Keyword
hi link alchemyDirective  Statement
hi link alchemyLibrary    Include
hi link alchemyDocstring Comment
hi link alchemyDocType Type
hi def link alchemyString String
hi def link alchemyDec Number
hi def link alchemyHex Number
hi def link alchemyOct Number
hi def link alchemyBin Number
hi def link alchemySpecial Special

let b:current_syntax = "alchemy"
