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
badd +18 src/day_4/day_4_extend.res
badd +2 src/day_4/input
badd +34 src/day_4/puzzle.md
badd +1 src/day_4
badd +4 src/day_4/test
badd +12 README.md
badd +1 src/day_4/day_4.res
badd +1 day_5/
badd +1 day_5
badd +1 src/day_5/puzzle.md
badd +0 src/day_5/day_5.res
argglobal
%argdel
$argadd ~/personal/aoc-2022-rescript
edit src/day_5/puzzle.md
argglobal
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
let s:l = 57 - ((56 * winheight(0) + 37) / 74)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 57
normal! 03|
lcd ~/personal/aoc-2022-rescript
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
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
