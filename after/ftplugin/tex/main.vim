" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
" let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'

function! s:TexFocusVim() abort
  " Give window manager time to recognize focus moved to Zathura;
  " tweak the 200m as needed for your hardware and window manager.
  sleep 200m  

  " Refocus Vim and redraw the screen
  silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventView call s:TexFocusVim()
augroup END

" Get Vim's window ID for switching focus from Zathura to Vim using xdotool.
" Only set this variable once for the current Vim instance.
if !exists("g:vim_window_id")
  let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim(delay_ms) abort
  " Give window manager time to recognize focus 
  " moved to PDF viewer before focusing Vim.
  let delay = a:delay_ms . "m"
  execute 'sleep ' . delay
  execute "!xdotool windowfocus " . expand(g:vim_window_id)
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  " Post-forward-search refocus with 200ms delay---tweak as needed
  au User VimtexEventView call s:TexFocusVim(200)

  " Only perform post-inverse-search refocus on gVim; delay unnecessary
  if has("gui_running")
    au User VimtexEventViewReverse call s:TexFocusVim(0)
  endif
augroup END

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "," 

" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  


" trigger forward search
nmap <localleader>v <Plug>(vimtex-view)

" Use `<localleader>c` to trigger continuous compilation...
nmap <localleader>c <Plug>(vimtex-compile)

" ...or single-shot compilation, if you prefer.
nmap <localleader>s <Plug>(vimtex-compile-ss)

" test to check remapping 
nmap <localleader>t :echo "hoi daar hier"<ENTER>
