if exists("b:current_syntax")
    finish
endif

syn region metaBlock start="---" end="---" keepend
syn region gymTagBlock start="{" end="}" contains=gymTag,gymTagValue

syn match metaBlockDelimiter "---" containedin=metaBlock contained
syn match gymMetaOp /q/ containedin=metaBlock contained
syn match gymMetaLabel "^\zs[^:]\+\ze:" containedin=metaBlock contained
syn match gymMetaValue /:\zs.*$/ containedin=metaBlock contains=gymMetaComment contained
syn match gymMetaComment /#.*/ containedin=metaBlock contained

syn match gymDistance /\c\ft\|mi\|m\|km/ 
syn match gymComment /#.*$/
syn match gymNumber /\d\(\.\)\?/
syn match gymBodyweight "\(b\|B\)\(W\|w\)"
syn match gymExId /^\s*\zs\d\+[a-z]\?\ze)/
syn match gymExName /[\)]\s*\(.*\)/ contains=gymComment,gymParen
syn match gymOp /[\*\:x,@]/
syn match gymParen /[\)]/ containedin=gymExId contained
syn match gymTag "\w\+" contained
syn match gymTagValue ":\zs[^,}\s]\+" contained

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
hi def link gymTag Keyword
hi def link gymTagValue Special

hi def link ExerciseInfo Function

