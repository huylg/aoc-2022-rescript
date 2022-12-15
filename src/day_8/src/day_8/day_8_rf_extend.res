let input =
  Node.Fs.readFileAsUtf8Sync("src/day_8/test")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))
  ->Belt.Array.flatMap(a => a)

let length = input->Belt.Array.length->Belt.Float.fromInt->Js.Math.sqrt->Belt.Int.fromFloat

input
->Belt.Array.mapWithIndex((i, e) => {
  let x = i / length
  let y = mod(i, length)

  e
})
->Js.log

/* input */
/* ->Belt.Array.mapWithIndex((x, line) => */
/* line->Belt.Array.mapWithIndex((y, e) => { */
/* let left = line->Belt.Array.slice(~offset=0, ~len=y)->Belt.Array.every(a => a < e) */
/* let right = line->Belt.Array.sliceToEnd(y + 1)->Belt.Array.every(a => a < e) */
/* let top = */
/* input */
/* ->Belt.Array.slice(~offset=0, ~len=x) */
/* ->Belt.Array.map(_, Belt.Array.getUnsafe(_, y)) */
/* ->Belt.Array.every(a => a < e) */
/* let bottom = */
/* input */
/* ->Belt.Array.sliceToEnd(x + 1) */
/* ->Belt.Array.map(_, Belt.Array.getUnsafe(_, y)) */
/* ->Belt.Array.every(a => a < e) */
/* if left || right || top || bottom { */
/* Some((x, y)) */
/* } else { */
/* None */
/* } */
/* }) */
/* ) */
/* ->Belt.Array.flatMap(a => a) */
/* ->Belt.Array.keepMap(a => a) */
/* ->Js.log */
