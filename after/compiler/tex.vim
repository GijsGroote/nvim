
" This code would go in compiler/tex.vim

" First create a script-local variable `s:latexmk` to store the latexmk command
" let s:latexmk = 'latexmk -pdf -output-directory=%:h %'

" Then set `makeprg` to the value of `s:latexmk`
" let &l:makeprg = expand(s:latexmk)


"
" " Set `makeprg` command values for both pdflatex and latexmk
" let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode ' .
"       \ '-halt-on-error -synctex=1 -output-directory=%:h %'
" " (Using '\' just continues a Vimscript expression on a new line for better readability)
" let s:latexmk = 'latexmk -pdf -output-directory=%:h %'
"
" " Create a variable to store pdflatex/latexmk state
" " Possible values: 1 for latexmk and 0 for pdflatex
" let b:tex_use_latexmk = 0
"
" " Toggles between latexmk and pdflatex
" function! s:TexToggleLatexmk() abort
"   if b:tex_use_latexmk  " if latexmk is on, turn it off
"     let b:tex_use_latexmk = 0
"   else  " if latexmk is off, turn it on
"     let b:tex_use_latexmk = 1
"   endif
"   call s:TexSetMakePrg()  " update Vim's `makeprg` option
" endfunction
"
" " Sets the value of `makeprg` based on current value of `b:tex_use_latexmk`
" function! s:TexSetMakePrg() abort
"   if b:tex_use_latexmk
"     let &l:makeprg = expand(s:latexmk)
"   else
"     let &l:makeprg = expand(s:pdflatex)
"   endif

