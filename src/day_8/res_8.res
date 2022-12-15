let input = Node.Fs.readFileAsUtf8Sync("src/day_8/test")->Js.String2.split("\n")
let _ = input->Js.Array2.pop

let maxUntil = Js.Array.reduce((result, cur) => {
  let len = Belt.Array.length(result)
  result->Belt.Array.get(len - 1)->Js.log

  result
  ->Belt.Array.get(len - 1)
  ->Belt.Option.getWithDefault(min_int)
  ->max(cur)
  ->Belt.Array.push(result, _)
  result
}, [])

let trees =
  input
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))

let _ = trees->Belt.Array.map(maxUntil)
