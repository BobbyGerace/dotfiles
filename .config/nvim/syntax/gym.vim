if exists("b:current_syntax")
    finish
endif

syn region metaBlock start="---" end="---" keepend contains=gymStringBlock,gymNumber
syn region gymTagBlock start="{" end="}" contains=gymTag,gymTagValue,gymNumber,gymStringBlock
syn region gymStringBlock start="\"" end="\""


syn match metaBlockDelimiter "---" containedin=metaBlock contained
syn match gymMetaOp /:/ containedin=metaBlock contained
syn match gymMetaLabel "^\s*\zs[a-zA-Z_][0-9a-zA-Z_-]*" containedin=metaBlock contained
syn match gymMetaValue /:\s*.\+$/ containedin=metaBlock contains=gymMetaComment,gymMetaOp contained
"syn match gymMetaLabel "^\zs[a-zA-Z_][0-9a-zA-Z_-]*\ze:" containedin=metaBlock contained
"syn match gymMetaValue /:\s*\zs.\+$/ containedin=metaBlock contains=gymMetaComment contained
syn match gymMetaComment /\/\/.*/ containedin=metaBlock contained

syn match gymNumber /-\?\d\(\.\)\?\d*/
syn match gymPlaceholderValue "?"
syn match gymDistance /\c\ft\|mi\|m\|km\|in\|cm\|lb\|kg\|sets\|set/ 
syn match gymComment /\/\/.*$/
syn match gymNumber /\d\(\.\)\?/
syn match gymBodyweight "\(b\|B\)\(W\|w\)"
" syn match gymExName /[\)]\s*\([^\#{}"]*\)/ contains=gymComment,gymParen,gymString
syn match gymExIndicator /^\s*[\#\&]\?\ze/ containedin=gymExName contained
syn match gymExName /^\s*[\#\&]\s*\(.*\)/ contains=gymComment,gymExIndicator

syn match gymOp /[\*\:x,@]/
syn match gymParen /[\)]/ containedin=gymExId contained
syn match gymTag "[a-zA-Z_][0-9a-zA-Z_-]*" contained
syn match gymTagValue ":\zs\s*[a-zA-Z_][a-zA-Z0-9_-]*" contained

highlight ExerciseInfo cterm=underline gui=undercurl
highlight Error cterm=underline gui=undercurl
highlight UnmatchedExercise cterm=undercurl ctermfg=yellow guifg=yellow gui=undercurl

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
hi def link gymBodyweight Number
hi def link gymExName Function
hi def link gymOp Operator
hi def link gymTagValue String
hi def link gymTag Label
hi def link gymExIndicator Operator
hi def link gymPlaceholderValue Todo 

hi def link ExerciseInfo Function

hi def link gymStringBlock String
