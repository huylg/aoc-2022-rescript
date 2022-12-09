let lines = Node.Fs.readFileAsUtf8Sync("src/day_2/test.txt")->Js.String2.split("\n")
let length = lines->Belt.Array.length

let result = [
  (("A", "X"), 3),
  (("A", "Y"), 6),
  (("A", "Z"), 0),
  (("B", "X"), 0),
  (("B", "Y"), 3),
  (("B", "Z"), 6),
  (("C", "X"), 6),
  (("C", "Y"), 0),
  (("C", "Z"), 3),
]

let score = [("X", 1), ("Y", 2), ("Z", 3)]

lines
->Belt.Array.slice(~offset=0, ~len=length - 1)
->Belt.Array.map(Js.String.split(" ", _))
->Belt.Array.map(e => (e->Belt.Array.getExn(0), e->Belt.Array.getExn(1)))
->Belt.Array.reduce(0, (acc, (a, b)) =>
  acc +
  result->Belt.Array.getBy(((x, _)) => x == (a, b))->Belt.Option.mapWithDefault(0, ((_, y)) => y) +
  score->Belt.Array.getBy(((x, _)) => x == b)->Belt.Option.mapWithDefault(0, ((_, y)) => y)
)
->Js.log
