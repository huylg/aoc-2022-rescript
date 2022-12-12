let input =
  Node.Fs.readFileAsUtf8Sync("src/day_5/test")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")

let fromArrayToStack = a => {
  a->Belt.Array.reduce(Belt.MutableStack.make(), (stack, cur) => {
    Belt.MutableStack.push(stack, cur)
    stack
  })
}
//delete [ and ] from the string
let formatPackage = s => s

let stacks =
  input
  ->Belt.Array.slice(~offset=0, ~len=3)
  ->Belt.Array.map(Js.String2.split(_, ""))

  /* ->Belt.Array.map(Belt.Array.keep(_, e => e != "[" && e != "]")) */
  /* ->Belt.Array.reduce("", (acc, e) => acc ++ e) */
  ->Js.log
/* ->Belt.Array.map(Js.String2.split(_, " ")) */
/* ->Belt.Array.map(fromArrayToStack) */

/* type action = {amount: int, from: int, to: int} */
/*  */
/* let actions = */
/* input */
/* ->Belt.Array.sliceToEnd(4) */
/* ->Belt.Array.map(Js.String2.split(_, " ")) */
/* ->Belt.Array.map(e => { */
/* amount: e->Belt.Array.getUnsafe(1)->Belt.Int.fromString->Belt.Option.getUnsafe, */
/* from: e->Belt.Array.getUnsafe(3)->Belt.Int.fromString->Belt.Option.getUnsafe - 1, */
/* to: e->Belt.Array.getUnsafe(5)->Belt.Int.fromString->Belt.Option.getUnsafe - 1, */
/* }) */
/*  */
/*  */
/* actions */
/* ->Belt.Array.reduce(stacks, (acc, cur) => { */
/* let from = acc->Belt.Array.getUnsafe(cur.from) */
/* let to = acc->Belt.Array.getUnsafe(cur.to) */
/*  */
/* for _ in 0 to cur.amount { */
/* switch from->Belt.MutableStack.pop { */
/* | None => () */
/* | Some(v) => to->Belt.MutableStack.push(v) */
/* } */
/* } */
/*  */
/* acc->Belt.Array.setUnsafe(cur.from, from) */
/* acc->Belt.Array.setUnsafe(cur.to, to) */
/* acc */
/* }) */
