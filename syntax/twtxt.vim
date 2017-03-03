"    twtxt.vim - a hacky vim syntax file for twtxt files.
"    Copyright (C) 2017 Jervis Tetch <jervis@nasarok.de>
"
"    This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 3 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>. Vim syntax file

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

syn match twtxtTimestamp	/^.\{-}\t\@=/ contains=twtxtTimestampC,twtxtTimestampD
" characters in timestamp:
syn match twtxtTimestampC	/[TtZz]\{1}/ contained
" delimiters (:.-) in timestamp:
syn match twtxtTimestampD	/[\.:\+-]/ contained

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

