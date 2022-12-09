let lines = Node.Fs.readFileAsUtf8Sync("src/day_2/test.txt")->Js.String2.split("\n")
let length = lines->Belt.Array.length

let result = [
  (("A", "X"), 3),
  (("A", "Y"), 1),
  (("A", "Z"), 2),
  (("B", "X"), 1),
  (("B", "Y"), 2),
  (("B", "Z"), 3),
  (("C", "X"), 2),
  (("C", "Y"), 3),
  (("C", "Z"), 1),
]

let score = [("X", 0), ("Y", 3), ("Z", 6)]

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
