Node.Fs.readFileAsUtf8Sync("./src/day_4/input")
->Js.String2.split("\n")
->Belt.Array.keep(e => e != "")
->Belt.Array.keep(e => {
  let splits =
    Js.String2.split(e, ",")
    ->Belt.Array.flatMap(e => Js.String2.split(e, "-"))
    ->Belt.Array.map(Belt.Int.fromString)
  let a = splits->Belt.Array.getUnsafe(0)
  let b = splits->Belt.Array.getUnsafe(1)
  let c = splits->Belt.Array.getUnsafe(2)
  let d = splits->Belt.Array.getUnsafe(3)

  compare(a, c) * compare(b, d) <= 0
})
->Belt.Array.length
->Js.log
