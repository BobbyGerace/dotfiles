if exists("b:current_syntax")
    finish
endif

syn region metaBlock start="---" end="---" keepend contains=gymStringBlock,gymNumber
syn region gymTagBlock start="{" end="}" contains=gymTag,gymTagValue,gymNumber,gymStringBlock
syn region gymStringBlock start="\"" end="\""


syn match metaBlockDelimiter "---" containedin=metaBlock contained
syn match gymMetaOp /:/ containedin=metaBlock contained
syn match gymMetaLabel "^\zs[a-zA-Z_][0-9a-zA-Z_-]*\ze:" containedin=metaBlock contained
syn match gymMetaValue /:\zs.*$/ containedin=metaBlock contains=gymMetaComment contained
syn match gymMetaComment /#.*/ containedin=metaBlock contained

syn match gymNumber /-\?\d\(\.\)\?\d*/
syn match gymPlaceholderValue "?"
syn match gymDistance /\c\ft\|mi\|m\|km\|in\|cm\|lb\|kg/ 
syn match gymComment /#.*$/
syn match gymBodyweight "\(b\|B\)\(W\|w\)"
syn match gymExId /^\s*\zs\d\+[a-z]\?\ze)/
syn match gymExName /[\)]\s*\([^\#{}"]*\)/ contains=gymComment,gymParen,gymString
syn match gymOp /[\*\:x,@]/
syn match gymParen /[\)]/ containedin=gymExId contained
syn match gymTag "[a-zA-Z_][0-9a-zA-Z_-]*" contained
syn match gymTagValue ":\zs\s*[a-zA-Z_][a-zA-Z0-9_-]*" contained

highlight ExerciseInfo cterm=underline gui=undercurl
highlight Error cterm=underline gui=undercurl
hi def link metaBlock PreProc
hi def link gymTagBlock Special
hi def link metaBlockDelimiter Delimiter
hi def link gymMetaOp Operator
hi def link gymMetaLabel Label
hi def link gymMetaValue String
hi def link gymMetaComment Comment
hi def link gymDistance Type
hi def link gymComment Comment
hi def link gymNumber Number
hi def link gymBodyweight SpecialChar
hi def link gymExId Identifier
hi def link gymExName Function
hi def link gymOp Operator
hi def link gymParen Delimiter
hi def link gymTagValue String
hi def link gymTag Label
hi def link gymPlaceholderValue Todo 

hi def link ExerciseInfo Function

hi def link gymStringBlock String
