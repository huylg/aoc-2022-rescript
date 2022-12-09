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
badd +154 term://~/personal/aoc-2022-rescript//5268:/bin/zsh
badd +25 term://~/personal/aoc-2022-rescript//17636:/bin/zsh
badd +172 node_modules/rescript/lib/ocaml/js.ml
badd +1 src/day_2/day_2.res
badd +7 term://~/personal/aoc-2022-rescript//74712:yarn\ res:watch
badd +1 package.json
badd +2 term://~/personal/aoc-2022-rescript//74798:yarn\ res:start
badd +35 src/day_3/day_3_extenend.res
badd +1 src/day_3
badd +1 src/day_3/test.txt
badd +78 node_modules/rescript/lib/ocaml/belt_MapDict.mli
badd +1 src/day_3/day_3.res
badd +17 src/day_4/day_4_extend.res
badd +2 src/day_4/input
badd +52 src/day_4/puzzle.md
badd +1 src/day_4
badd +4 src/day_4/test
badd +12 README.md
badd +1 src/day_4/day_4.res
argglobal
%argdel
$argadd ~/personal/aoc-2022-rescript
edit src/day_4/day_4_extend.res
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
exe 'vert 1resize ' . ((&columns * 137 + 137) / 275)
exe 'vert 2resize ' . ((&columns * 137 + 137) / 275)
argglobal
balt src/day_4/puzzle.md
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
let s:l = 15 - ((14 * winheight(0) + 37) / 74)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 033|
lcd ~/personal/aoc-2022-rescript
wincmd w
argglobal
if bufexists(fnamemodify("~/personal/aoc-2022-rescript/src/day_4/puzzle.md", ":p")) | buffer ~/personal/aoc-2022-rescript/src/day_4/puzzle.md | else | edit ~/personal/aoc-2022-rescript/src/day_4/puzzle.md | endif
if &buftype ==# 'terminal'
  silent file ~/personal/aoc-2022-rescript/src/day_4/puzzle.md
endif
balt ~/personal/aoc-2022-rescript/src/day_4/day_4_extend.res
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
let s:l = 34 - ((20 * winheight(0) + 37) / 74)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 34
normal! 0
lcd ~/personal/aoc-2022-rescript
wincmd w
exe 'vert 1resize ' . ((&columns * 137 + 137) / 275)
exe 'vert 2resize ' . ((&columns * 137 + 137) / 275)
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
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
