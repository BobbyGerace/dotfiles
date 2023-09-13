if exists("b:current_syntax")
    finish
endif

" Define the region that starts and ends with '---'
syn region metaBlock start="^---" end="^---" keepend

syn match metaBlockDelimiter "---" containedin=metaBlock contained
syn match gymMetaOp /q/ containedin=metaBlock contained
syn match gymMetaLabel "^\zs[^:]\+\ze:" containedin=metaBlock contained
syn match gymMetaValue /:\zs.*$/ containedin=metaBlock contains=gymMetaComment contained
syn match gymMetaComment /#.*/ containedin=metaBlock contained

syn match gymDistance /\c\ft\|mi\|m\|km/ 
syn match gymComment /#.*$/
syn match gymNumber /\d\(\.\)\?/
syn match gymBodyweight "\(b\|B\)\(W\|w\)"
syn match gymExId /^\zs\d\+[a-z]\?\ze)/
syn match gymExName /[\)]\s*\(.*\)/ contains=gymComment,gymParen
syn match gymOp /[\*\:x,@]/
syn match gymParen /[\)]/ containedin=gymExId contained

hi def link gymComment Comment
hi def link gymMetaComment Comment
hi def link gymExId Function
hi def link gymExName Label
hi def link gymOp Operator
hi def link gymParen Operator
hi def link gymNumber Number
hi def link gymBodyweight Number
hi def link gymMetaOp Operator
hi def link metaBlockDelimiter Operator
hi def link gymMetaLabel Keyword
hi def link gymDistance Operator
hi def link gymMetaValue String
" Define the region for the entire tag block
syn region gymTagBlock start="{" end="}" contains=gymTag,gymTagValue

" Match individual tags within the tag block
syn match gymTag "\w\+" contained

" Match tag values within the tag block
syn match gymTagValue ":\zs[^,}\s]\+" contained

" Link to highlight groups
hi def link gymTagBlock Operator
hi def link gymTag Function
hi def link gymTagValue String

