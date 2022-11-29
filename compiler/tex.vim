"
" " make sure that file output exist in the working directory
" let s:pdflatex= 'pdflatex -output-dir=output %'
" let s:latexmk = 'latexmk -pdf -output-directory=output %'
"
" " Then set `makeprg` to the value of `s:latexmk`
" let &l:makeprg = expand(s:latexmk)
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
" endfunction
"
" echo "111calling textSetmakepgr"
" call s:TexSetMakePrg()  " set value of Vim's `makeprg` option
"
