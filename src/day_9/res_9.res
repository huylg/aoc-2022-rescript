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

let h = ref(s)
let t = ref(s)

let result =
  Belt.Array.flatMap(input, ((d, step)) => Belt.Array.make(step, d))
  ->Belt.Array.map(d => {
    h :=
      switch d {
      | "D" => {
          x: h.contents.x,
          y: h.contents.y - 1,
        }
      | "U" => {
          x: h.contents.x,
          y: h.contents.y + 1,
        }
      | "L" => {
          x: h.contents.x - 1,
          y: h.contents.y,
        }
      | "R" => {
          x: h.contents.x + 1,
          y: h.contents.y,
        }
      | _ => s
      }

    t :=
      switch (h.contents.x - t.contents.x, t.contents.y - h.contents.y) {
      | (0, 2) => {
          x: t.contents.x,
          y: t.contents.y + 1,
        }
      | (0, -2) => {
          x: t.contents.x,
          y: t.contents.y - 1,
        }
      | (2, 0) => {
          x: t.contents.x + 1,
          y: t.contents.y,
        }
      | (-2, 0) => {
          x: t.contents.x - 1,
          y: t.contents.y,
        }
      | (2, _) => {
          x: t.contents.x - 1,
          y: t.contents.y - 1,
        }
      | (-2, _) => {
          x: t.contents.x + 1,
          y: t.contents.y + 1,
        }
      | _ => t.contents
      }

    t.contents
  })
  /* ->Belt.MutableSet.fromArray(~id=module(PairComparator)) */
  /* ->Belt.MutableSet.size */

result->Js.log
