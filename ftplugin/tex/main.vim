" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

let maplocalleader = "," 

" This enables Vim's and neovim's syntax-related features. Without this, some
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0  
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

" compilter settings
" make sure that folder output exist in the working directory
let s:pdflatex= 'pdflatex --output-directory=%:h/output %'

" latexmk compilation 
let s:latexmk = 'latexmk -pdf -silent -aux-directory=%:h/output %'

" Then set `makeprg` to the value of `s:latexmk`
let &l:makeprg = expand(s:latexmk)

" Create a variable to store pdflatex/latexmk state
" Possible values: 1 for latexmk and 0 for pdflatex
let b:tex_use_latexmk = 0

" Toggles between latexmk and pdflatex
function! s:TexToggleLatexmk() abort
  if b:tex_use_latexmk  " if latexmk is on, turn it off
    let b:tex_use_latexmk = 0
  else  " if latexmk is off, turn it on
    let b:tex_use_latexmk = 1
  endif
  call s:TexSetMakePrg()  " update Vim's `makeprg` option
endfunction

" Sets the value of `makeprg` based on current value of `b:tex_use_latexmk`
function! s:TexSetMakePrg() abort
  if b:tex_use_latexmk
    let &l:makeprg = expand(s:pdflatex)
  else
    let &l:makeprg = expand(s:latexmk)
  endif
endfunction

call s:TexSetMakePrg()  " set value of Vim's `makeprg` option

" test to check remapping 
" nmap <localleader>t :echo "test"

nmap <localleader>r <Cmd>make<CR>
nmap <localleader>f <Plug>TexFocusVim()

nmap <localleader>o <Plug>TexToggleLatexmk
nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>


" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  


" trigger forward search
nmap <localleader>v <Plug>(vimtex-view)

" Use `<localleader>c` to trigger continuous compilation...
nmap <localleader>c <Plug>(vimtex-compile)

" ...or single-shot compilation, if you prefer.
nmap <localleader>s <Plug>(vimtex-compile-ss)

