Node.Fs.readFileAsUtf8Sync("./src/day_1/test.txt")
->Js.String.split("\n", _)
->Belt.Array.reduce([0], (acc, cur) => {
  if cur == "" {
    acc->Belt.Array.concat([0])
  } else {
    let last = acc->Belt.Array.length - 1
    let calo = acc->Belt.Array.getUnsafe(last) + cur->Belt.Int.fromString->Belt.Option.getUnsafe
    acc->Belt.Array.setUnsafe(last, calo)
    acc
  }
})
->Belt.SortArray.stableSortBy((a, b) => b - a)
->Belt.Array.slice(~offset=0, ~len=3)
->Belt.Array.reduce(0, (acc, cur) => acc + cur)
->Js.log
