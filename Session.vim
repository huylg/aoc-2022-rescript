let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/personal/aoc-2022-rescript
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
badd +1 src/day_5/puzzle.md
badd +39 src/day_5/day_5_extend.res
badd +1 src/day_5
badd +21 src/day_5/input
badd +7 src/day_5/test
badd +46 /workspaces/aoc-2022-rescript/node_modules/rescript/lib/ocaml/belt_MutableStack.mli
badd +38 src/day_5/internet.js
badd +1 src/day_5/day_5.bs.js
badd +1 src/day_5/day_5.res
badd +1 src/day_6/day_6.res
badd +50 src/day_6/puzzle.md
badd +1 src/day_6/input
badd +5 node_modules/rescript/lib/ocaml/belt_MutableMap.mli
badd +5 src/day_6/day_6_extend.res
badd +44 src/day_7/day_7_extend.res
badd +104 src/day_7/puzzle.md
badd +13 src/day_7/input
badd +1 src/day_7
badd +12 src/day_7/test
badd +70 src/day_7/day_7.bs.js
badd +48 src/day_7/day_7.res
badd +69 src/day_7/day_7_extend.bs.js
badd +447 term://~/personal/aoc-2022-rescript//14570:/bin/zsh
argglobal
%argdel
$argadd ~/personal/aoc-2022-rescript
edit src/day_7/puzzle.md
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
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
exe '2resize ' . ((&lines * 35 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
exe '3resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 159 + 160) / 320)
argglobal
if bufexists(fnamemodify("term://~/personal/aoc-2022-rescript//14570:/bin/zsh", ":p")) | buffer term://~/personal/aoc-2022-rescript//14570:/bin/zsh | else | edit term://~/personal/aoc-2022-rescript//14570:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/personal/aoc-2022-rescript//14570:/bin/zsh
endif
balt src/day_7/day_7_extend.res
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1154 - ((68 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1154
normal! 0
lcd ~/personal/aoc-2022-rescript
wincmd w
argglobal
balt ~/personal/aoc-2022-rescript/src/day_7/input
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
let s:l = 112 - ((25 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 112
normal! 0
lcd ~/personal/aoc-2022-rescript
wincmd w
argglobal
if bufexists(fnamemodify("~/personal/aoc-2022-rescript/src/day_7/day_7_extend.res", ":p")) | buffer ~/personal/aoc-2022-rescript/src/day_7/day_7_extend.res | else | edit ~/personal/aoc-2022-rescript/src/day_7/day_7_extend.res | endif
if &buftype ==# 'terminal'
  silent file ~/personal/aoc-2022-rescript/src/day_7/day_7_extend.res
endif
balt ~/personal/aoc-2022-rescript/src/day_7/day_7.res
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
let s:l = 70 - ((15 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 70
normal! 04|
lcd ~/personal/aoc-2022-rescript
wincmd w
exe 'vert 1resize ' . ((&columns * 160 + 160) / 320)
exe '2resize ' . ((&lines * 35 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
exe '3resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 159 + 160) / 320)
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
