" Vim indent file
" Language:		Text, Rspec Story Format
" Maintainer:		Mike Vincent <mike@vincent.ws>
" Info:			$Id: story.vim,v 0.0.1 2007/11/15 13:54:25 mike Exp $
" URL:			http://mike.vincent.ws
" Anon CVS:		See above site
" Release Coordinator:	Mike Vincent <mike@vincent.ws>

" 0. Initialization {{{1
" =================

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetStoryIndent()
setlocal indentkeys=*<Return>,o,O,!^F ",=Story,=Scenario,=Given,=When,=Then,=And

" Only define the function once.
if exists("*GetStoryIndent")
  finish
endif

function! GetStoryIndent()
  let vcol = col('.')
  call cursor(v:lnum,1)
  call cursor(v:lnum,vcol)
  let ind = indent(v:lnum)

  let lnum = prevnonblank(v:lnum-1)
  let line = getline(lnum)
  let cline = getline(v:lnum)

  " Story statements should always start at margin 0
  if cline =~# '^\s*Story' 
    let ind = 0
  endif

  " Scenario statements should always start 2 indentations in
  if cline =~# '^\s*Scenario'
    let ind = 0 + (&sw * 2)
  endif

  " Story content should start 1 indentation in
  if line =~# '^\s*Story' && cline !~# '^\s*Scenario'
    let ind = 0 + &sw
  endif
  
  " Given, When, Then, And company should start 3 indentations in 
  if cline =~# '^\s*Given'
    let ind = 0 + (&sw * 3)
  endif

  return ind
endfunction

" vim:set sw=2 sts=2 ts=2 et ff=unix:
