let input = Node.Fs.readFileAsUtf8Sync("src/day_8/test")->Js.String2.split("\n")
let _ = input->Js.Array2.pop

let maxUntil = a =>
  a->Belt.Array.reduce([], (result, cur) => {
    let len = Belt.Array.length(result)

    result
    ->Belt.Array.get(len - 1)
    ->Belt.Option.getWithDefault(min_int)
    ->max(cur)
    ->Belt.Array.push(result, _)
    result
  })

let trees =
  input
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))

let left = trees->Belt.Array.map(maxUntil)
let right = trees->Belt.Array.map(Belt.Array.reverse)->Belt.Array.map(maxUntil)
let top = trees->JsArray2Ex.transpose->Belt.Array.map(maxUntil)
let bottom =
  trees->JsArray2Ex.transpose->Belt.Array.map(Belt.Array.reverse)->Belt.Array.map(maxUntil)

let min_ = (a, b) => a->Belt.Array.zipBy(b, min)
let min__ = (a, b) => a->Belt.Array.zipBy(b, min_)

left->min__(right)->min__(top)->min__(bottom)->Js.log
trees->Js.log
