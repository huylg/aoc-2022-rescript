let dictionary = Belt.Map.String.fromArray([
  ("a", 1),
  ("b", 2),
  ("c", 3),
  ("d", 4),
  ("e", 5),
  ("f", 6),
  ("g", 7),
  ("h", 8),
  ("i", 9),
  ("j", 10),
  ("k", 11),
  ("l", 12),
  ("m", 13),
  ("n", 14),
  ("o", 15),
  ("p", 16),
  ("q", 17),
  ("r", 18),
  ("s", 19),
  ("t", 20),
  ("u", 21),
  ("v", 22),
  ("w", 23),
  ("x", 24),
  ("y", 25),
  ("z", 26),
  ("A", 27),
  ("B", 28),
  ("C", 29),
  ("D", 30),
  ("E", 31),
  ("F", 32),
  ("G", 33),
  ("H", 34),
  ("I", 35),
  ("J", 36),
  ("K", 37),
  ("L", 38),
  ("M", 39),
  ("N", 40),
  ("O", 41),
  ("P", 42),
  ("Q", 43),
  ("R", 44),
  ("S", 45),
  ("T", 46),
  ("U", 47),
  ("V", 48),
  ("W", 49),
  ("X", 50),
  ("Y", 51),
  ("Z", 52),
])

let stringToMapInt = e =>
  Js.String2.split(e, "")
  ->Belt.Array.map(dictionary->Belt.Map.String.getExn)
  ->Belt.Set.Int.fromArray

let sum = (a, b) => a + b

Node.Fs.readFileAsUtf8Sync("./src/day_3/test.txt")
->Js.String2.split("\n")
->Belt.Array.keep(e => e != "")
->Belt.Array.map(e => {
  let length = e->Js.String2.length / 2
  let firstHalf = Js.String2.slice(e, ~from=0, ~to_=length)
  let lastHalf = Js.String2.sliceToEnd(e, ~from=length)
  (firstHalf, lastHalf)
})
->Belt.Array.map(((a, b)) => Belt.Set.Int.intersect(a->stringToMapInt, b->stringToMapInt))
->Belt.Array.map(Belt.Set.Int.toArray)
->Belt.Array.map(Belt.Array.getUnsafe(_, 0))
->Belt.Array.reduce(0, sum)
->Js.log
