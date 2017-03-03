" Vim syntax file
" Language:	twtxt
" Maintainer:	Jervis Tetch <jervis@nasarok.de>
" Last Change:	03 March 2017

if exists("b:current_syntax")
    finish
endif

syn case match

syn match twtxtMentionAt	/@\(\_s\)\@!/
syn match twtxtMentionLt	/\(@\)\@<=</
syn match twtxtMentionNick	/\(@<\{1}\)\@<=\(.\{-}\)\_s\@=/
syn match twtxtMentionAltNick	/\(@\@<=[^<]\{1}\)\(.\{-}\)\_s\@=/
syn match twtxtMentionURL	/\(\s\|<\)\@<=\(http\|https\)\(.\{-}\)>\@=/
syn match twtxtMentionGt	/\(\(http\|https\).*\)\@<=>/

syn match twtxtTimestamp	/^.\{-}Z/ contains=twtxtTimestampC,twtxtTimestampD
" characters in timestamp:
syn match twtxtTimeStampC	/\(T\|Z\)/ contained
" delimiters (:.-) in timestamp:
syn match twtxtTimeStampD	/[\.:-]/ contained

syn match twtxtHashtag		/#.\{-}\(\_s\)/

let b:current_syntax = "twtxt"

hi def link twtxtMentionAt	Special
hi def link twtxtMentionLt	Statement
hi def link twtxtMentionGt	Statement
hi def link twtxtMentionNick	Label
hi def link twtxtMentionAltNick	Label
hi def link twtxtMentionURL	Underlined

hi def link twtxtTimestamp	Number
hi def link twtxtTimestampD	Label
hi def link twtxtTimestampC	SpecialChar

hi def link twtxtHashtag	Keyword

