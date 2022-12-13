let input =
  Node.Fs.readFileAsUtf8Sync("src/day_5/input")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")

let stacks = [
  [],
  ["W", "R", "F"],
  ["T", "H", "M", "C", "D", "V", "W", "P"],
  ["P", "M", "Z", "N", "L"],
  ["J", "C", "H", "R"],
  ["C", "P", "G", "H", "Q", "T", "B"],
  ["G", "C", "W", "L", "F", "Z"],
  ["W", "V", "L", "Q", "Z", "J", "G", "C"],
  ["P", "N", "R", "F", "W", "T", "V", "C"],
  ["J", "W", "H", "G", "R", "S", "V"],
]

let pp = a => Belt.Array.map(a, Belt.Array.reduce(_, "", (a, b) => a ++ b))->Js.log

type actiontype = {amount: int, from: int, to: int}

let actions =
  input
  ->Belt.Array.sliceToEnd(9)
  ->Belt.Array.map(Js.String2.split(_, " "))
  ->Belt.Array.map(e => {
    amount: e->Belt.Array.getUnsafe(1)->Belt.Int.fromString->Belt.Option.getUnsafe,
    from: e->Belt.Array.getUnsafe(3)->Belt.Int.fromString->Belt.Option.getUnsafe,
    to: e->Belt.Array.getUnsafe(5)->Belt.Int.fromString->Belt.Option.getUnsafe,
  })

actions->Js.Array2.forEach(action => {
  let fromStack = stacks->Belt.Array.getUnsafe(action.from)
  let toStack = stacks->Belt.Array.getUnsafe(action.to)
  let temp =
    fromStack->Js.Array2.spliceInPlace(
      ~pos=fromStack->Belt.Array.length - action.amount,
      ~remove=action.amount,
      ~add=[],
    )
  let _ = toStack->Js.Array2.pushMany(temp)
})

stacks
->Belt.Array.map(Js.Array2.pop)
->Belt.Array.sliceToEnd(1)
->Belt.Array.reduce("", (acc, cur) => acc ++ cur->Belt.Option.getWithDefault(""))
->Js.log
