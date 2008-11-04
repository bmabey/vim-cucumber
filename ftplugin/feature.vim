" Vim filetype plugin
" Language:	Rspec plain text story format
" Maintainer:	Mike Vincent <mike@vincent.ws>
" Last Change:	2008 Feb 08

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

let b:story_dir = expand("%:p:h")
let &l:path = fnamemodify(b:story_dir, ':h').",".&l:path
let b:undo_ftplugin = "setl path<"

setlocal textwidth=72
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal spell

" TODO: Write a helper function that will grab a selected block of
" Given, When, Then, And statements and open the alternate file and
" create step stubs
"
" TODO: make it so when a story/step is saved it's run and the output is 
" tossed into a preview window..
