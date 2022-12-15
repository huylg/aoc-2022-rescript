let input = Node.Fs.readFileAsUtf8Sync("src/day_8/input")->Js.String2.split("\n")
let _ = input->Js.Array2.pop

let max_ = (a, b) => {
  if a == b {
    a + 1
  } else {
    max(a, b)
  }
}

let maxUntil = a =>
  a->Belt.Array.reduce([], (result, cur) => {
    let len = Belt.Array.length(result)

    result
    ->Belt.Array.get(len - 1)
    ->Belt.Option.getWithDefault(min_int)
    ->max_(cur)
    ->Belt.Array.push(result, _)
    result
  })

let trees =
  input
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))

let left = trees->Belt.Array.map(maxUntil)
let right =
  trees
  ->Belt.Array.map(Belt.Array.reverse)
  ->Belt.Array.map(maxUntil)
  ->Belt.Array.map(Belt.Array.reverse)
let top = trees->JsArray2Ex.transpose->Belt.Array.map(maxUntil)->JsArray2Ex.transpose
let bottom =
  trees
  ->Belt.Array.reverse
  ->JsArray2Ex.transpose
  ->Belt.Array.map(maxUntil)
  ->JsArray2Ex.transpose
  ->Belt.Array.reverse

let min_ = (a, b) => a->Belt.Array.zipBy(b, min)
let min__ = (a, b) => a->Belt.Array.zipBy(b, min_)

let less_ = (a, b) => Belt.Array.zipBy(a, b, (a, b) => a < b)

let results = min__(left, right)->min__(top)->min__(bottom)

let pp = a =>
  a
  ->Belt.Array.map(Belt.Array.joinWith(_, "", Belt.Int.toString))
  ->Belt.Array.joinWith("\n", a => a)
  ->Js.log

results->pp

let _ =
  results
  ->Belt.Array.zipBy(trees, (result, tree) => Belt.Array.zipBy(result, tree, (a, b) => a <= b))
  ->Belt.Array.map(
    Belt.Array.map(_, a => {
      if a {
        1
      } else {
        0
      }
    }),
  )
  ->Belt.Array.map(Belt.Array.joinWith(_, "", Belt.Int.toString))
  ->Belt.Array.joinWith("\n", a => a)
/* ->Belt.Array.flatMap(a => a) */
/* ->Belt.Array.keep(a => a) */
/* ->Belt.Array.length */
/* ->Js.log */

/* let _ = results->Belt.Array.zipBy(trees, (result, tree) => { */
/* let a = result->Belt.Array.zipBy(tree, (r, t) => r < t) */
/* a->Js.log */
/* a */
/* }) */
/* ->Belt.Array.map( */
/* Belt.Array.map(_, a => { */
/* if a { */
/* 1 */
/* } else { */
/* 0 */
/* } */
/* }), */
/* ) */
/* ->Belt.Array.map(Belt.Array.joinWith(_, "", Belt.Int.toString)) */
/* ->Belt.Array.joinWith("\n", a => a) */
/* ->Js.log */

/* result */
/* ->Belt.Array.zipBy(trees, (a, b) => eqOrGreater_(b, a)) */
/* ->Belt.Array.flatMap(a => a) */
/* ->Belt.Array.keep(a => a) */
/* ->Belt.Array.length */
/* ->Js.log */
