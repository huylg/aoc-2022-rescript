let input =
  Node.Fs.readFileAsUtf8Sync("src/day_8/input")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")
  ->Belt.Array.flatMap(Js.String.split(""))
  ->Belt.Array.map(Belt.Int.fromString)
  ->Belt.Array.map(Belt.Option.getUnsafe)

let len = Belt.Array.length(input)
let width = len->Belt.Float.fromInt->Js.Math.sqrt->Belt.Int.fromFloat
let scores = input->Belt.Array.mapWithIndex((i, cur) => {
  let x = i / width
  let y = mod(i, width)

  let left =
    Belt.Array.slice(input, ~offset=i - y, ~len=y)
    ->Belt.Array.reverse
    ->Belt.Array.getIndexBy(a => a >= cur)
    ->Belt.Option.mapWithDefault(y, a => a + 1)

  let right =
    Belt.Array.slice(input, ~offset=i + 1, ~len=width - y - 1)
    ->Belt.Array.getIndexBy(a => a >= cur)
    ->Belt.Option.mapWithDefault(width - y - 1, a => a + 1)

  let top =
    Belt.Array.makeBy(x, i => input->Belt.Array.getUnsafe(i * width + y))
    ->Belt.Array.reverse
    ->Belt.Array.getIndexBy(a => a >= cur)
    ->Belt.Option.mapWithDefault(x, a => a + 1)

  let bottom =
    Belt.Array.makeBy(width - x - 1, i => input->Belt.Array.getUnsafe((i + x + 1) * width + y))
    ->Belt.Array.getIndexBy(a => a >= cur)
    ->Belt.Option.mapWithDefault(width - x - 1, a => a + 1)

  let result = left * right * top * bottom

  result
})

scores->Belt.Array.reduce(0, max)->Js.log
