let input =
  Node.Fs.readFileAsUtf8Sync("src/day_8/test")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))

let count = ref(0)

let len = 5

let _ =
  input
  ->Belt.Array.mapWithIndex((x, line) =>
    line->Belt.Array.mapWithIndex((y, e) => {
      let row = Belt.Array.getUnsafe(input, x)
      let column = input->Belt.Array.map(Belt.Array.getUnsafe(_, y))
    })
  )
  ->Js.log
