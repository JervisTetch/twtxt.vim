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
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.

" Vim syntax file
" Language:	twtxt
" Maintainer:	Jervis Tetch <jervis@nasarok.de>
" Last Change:	08 March 2017

if exists("b:current_syntax")
    finish
endif

syn clear
syn case ignore

syn match twtxtStatus		/\v^.*$/
	\ contains=twtxtComment,
		\twtxtHashtag,
		\twtxtMention,
		\twtxtTimestamp,
		\twtxtURL
syn match twtxtComment		/^#\s.*$/
	\ contains=twtxtHashtag,
		\twtxtMention,
		\twtxtTimestamp,
		\twtxtURL
syn match twtxtTimestamp	/\v\d{4}-\d{2}-\d{2}t\d{2}:\d{2}:\d{2}[0-9\.:+z]*/
	\ contained
	\ contains=twtxtDelimiter,
		\twtxtSpecialChar,
		\twtxtNumber
syn match twtxtMention		/\v\zs\@.{-}\ze\_s/
	\ contained
	\ contains=twtxtAt,
		\twtxtGt,
		\twtxtLt,
		\twtxtNick,
		\twtxtURL
syn match twtxtNumber		/\d/
	\ contained
syn match twtxtSpecialChar	/[zt]/
	\ contained
syn match twtxtDelimiter	/[\.:-]/
	\ contained
syn match twtxtNick			/\zs.\{-}\ze\_s/
	\ contained
	\ nextgroup=twtxtURL
	\ skipwhite
syn match twtxtGt			/>/
	\ contained
	\ nextgroup=twtxtText
	\ skipwhite
syn match twtxtAt			/@/
	\ contained
	\ nextgroup=twtxtLt,
		\twtxtNick
syn match twtxtLt			/</
	\ contained
	\ nextgroup=twtxtURL,
		\twtxtNick
syn match twtxtURL			/\zs\(http\)s\?:.\{-}\ze\(>\|\_s\)/
	\ contained
	\ nextgroup=twtxtGt
syn match twtxtHashtag		/\zs#\S\+\ze\_s/
	\ contained

let b:current_syntax = "twtxt"

hi def link twtxtAt				Special
hi def link twtxtComment		Comment
hi def link twtxtDelimiter		Delimiter
hi def link twtxtGt				Statement
hi def link twtxtHashtag		Keyword
hi def link twtxtLt				Statement
hi def link twtxtNick			Label
hi def link twtxtNumber			Number
hi def link twtxtStatus			String
hi def link twtxtSpecialChar	SpecialChar
hi def link twtxtURL			Underlined

" vim: ts=4
