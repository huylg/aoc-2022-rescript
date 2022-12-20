let input =
  Node.Fs.readFileAsUtf8Sync("src/day_9/test")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")
  ->Belt.Array.map(Js.String.split(" "))
  ->Belt.Array.map(line => (
    line->Belt.Array.getUnsafe(0),
    line->Belt.Array.getUnsafe(1)->Belt.Int.fromString->Belt.Option.getUnsafe,
  ))

type point = {
  x: int,
  y: int,
}

type rope = {
  h: point,
  t: point,
}

module PairComparator = Belt.Id.MakeComparable({
  type t = point
  let cmp = (a, b) =>
    switch Pervasives.compare(a.x, b.x) {
    | 0 => Pervasives.compare(a.y, b.y)
    | c => c
    }
})
let points = Belt.MutableSet.make(~id=module(PairComparator))

let s = {
  x: 0,
  y: 0,
}

let h = [s]
let t = [s]

let sumPoint = (a, b) => {
  x: a.x + b.x,
  y: a.y + b.y,
}
let cal_gap = (a, b) => (a.x - b.x, a.y - b.y)

let last = a => {
  let len = a->Belt.Array.length
  a->Belt.Array.get(len - 1)
}
let _ = Belt.Array.flatMap(input, ((d, step)) =>
  Belt.Array.make(step, d)
)->Belt.Array.forEach(d => {
  let cur_h = h->last->Belt.Option.getUnsafe
  let cur_t = t->last->Belt.Option.getUnsafe

  let new_h = switch d {
  | "D" => cur_h->sumPoint({x: 0, y: -1})
  | "U" => cur_h->sumPoint({x: 0, y: 1})
  | "L" => cur_h->sumPoint({x: -1, y: 0})
  | "R" => cur_h->sumPoint({x: 1, y: 0})
  | _ => cur_h
  }

  let gap = cal_gap(new_h, cur_t)

  let new_t = switch gap {
  | () => expression
  | pattern2 => expression
  }


  /* let new_t = switch gap { */
  /* | (0, 2) => sumPoint(cur_t, {x: 0, y: 1}) */
  /* | (0, -2) => sumPoint(cur_t, {x: 0, y: -1}) */
  /* | (2, 0) => sumPoint(cur_t, {x: 1, y: 0}) */
  /* | (-2, 0) => sumPoint(cur_t, {x: -1, y: 0}) */
  /* | (2, 1) => sumPoint(cur_t, {x: 1, y: 1}) */
  /* | (-2, -1) => sumPoint(cur_t, {x: -1, y: -1}) */
  /* | (2, -1) => sumPoint(cur_t, {x: 1, y: -1}) */
  /* | (-2, 1) => sumPoint(cur_t, {x: -1, y: 1}) */
  /* | (1, 2) => sumPoint(cur_t, {x: 1, y: 1}) */
  /* | (-1, -2) => sumPoint(cur_t, {x: -1, y: -1}) */
  /* | (1, -2) => sumPoint(cur_t, {x: 1, y: -1}) */
  /* | (-1, 2) => sumPoint(cur_t, {x: -1, y: 1}) */
  /* | _ => cur_t */
  /* } */

  Belt.Array.push(h, new_h)
  Belt.Array.push(t, new_t)
})
t->Belt.MutableSet.fromArray(~id=module(PairComparator))->Belt.MutableSet.size->Js.log
