let input =
  Node.Fs.readFileAsUtf8Sync("src/day_8/input")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))

input
->Belt.Array.reduceWithIndex(0, (acc, line, x) =>
  acc +
  line->Belt.Array.reduceWithIndex(0, (acc, e, y) => {
    let left = line->Belt.Array.slice(~offset=0, ~len=y)->Belt.Array.every(a => a < e)
    let right = line->Belt.Array.sliceToEnd(y + 1)->Belt.Array.every(a => a < e)
    let top =
      input
      ->Belt.Array.slice(~offset=0, ~len=x)
      ->Belt.Array.map(_, Belt.Array.getUnsafe(_, y))
      ->Belt.Array.every(a => a < e)
    let bottom =
      input
      ->Belt.Array.sliceToEnd(x + 1)
      ->Belt.Array.map(_, Belt.Array.getUnsafe(_, y))
      ->Belt.Array.every(a => a < e)
    if left || right || top || bottom {
      acc + 1
    } else {
      acc
    }
  })
)
->Js.log
