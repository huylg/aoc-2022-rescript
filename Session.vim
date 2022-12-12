let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /workspaces/aoc-2022-rescript
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/personal/aoc-2022-rescript
badd +21 src/day_2/day_2_extend.res
badd +2209 src/day_1/test.txt
badd +2498 src/day_2/test.txt
badd +1 src/day_2
badd +173 node_modules/rescript/lib/ocaml/js.ml
badd +1 src/day_2/day_2.res
badd +1 package.json
badd +35 src/day_3/day_3_extenend.res
badd +1 src/day_3
badd +1 src/day_3/test.txt
badd +78 node_modules/rescript/lib/ocaml/belt_MapDict.mli
badd +1 src/day_3/day_3.res
badd +18 src/day_4/day_4_extend.res
badd +2 src/day_4/input
badd +34 src/day_4/puzzle.md
badd +1 src/day_4
badd +6 src/day_4/test
badd +12 README.md
badd +1 src/day_4/day_4.res
badd +1 day_5/
badd +1 day_5
badd +27 src/day_5/puzzle.md
badd +27 src/day_5/day_5.res
badd +1 src/day_5
badd +6 src/day_5/input
badd +7 src/day_5/test
badd +46 /workspaces/aoc-2022-rescript/node_modules/rescript/lib/ocaml/belt_MutableStack.mli
argglobal
%argdel
$argadd ~/personal/aoc-2022-rescript
edit src/day_5/test
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 160 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
argglobal
balt src/day_4/test
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 06|
wincmd w
argglobal
if bufexists(fnamemodify("src/day_5/day_5.res", ":p")) | buffer src/day_5/day_5.res | else | edit src/day_5/day_5.res | endif
if &buftype ==# 'terminal'
  silent file src/day_5/day_5.res
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 27 - ((26 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 06|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 160 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
