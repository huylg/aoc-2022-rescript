Node.Fs.readFileAsUtf8Sync("./src/day_4/input")
->Js.String2.split("\n")
->Belt.Array.keep(e => e != "")
->Belt.Array.keep(e => {
  let splits =
    Js.String2.split(e, ",")
    ->Belt.Array.flatMap(e => Js.String2.split(e, "-"))
    ->Belt.Array.map(Belt.Int.fromString)
  let a = splits->Belt.Array.getUnsafe(0)->Belt.Option.getUnsafe
  let b = splits->Belt.Array.getUnsafe(1)->Belt.Option.getUnsafe
  let c = splits->Belt.Array.getUnsafe(2)->Belt.Option.getUnsafe
  let d = splits->Belt.Array.getUnsafe(3)->Belt.Option.getUnsafe

  compare(a, c) * compare(b, c) +
  compare(a, d) * compare(b, d) +
  compare(c, a) * compare(d, a) +
  compare(c, b) * compare(d, b) != 4
})
->Belt.Array.length
->Js.log
