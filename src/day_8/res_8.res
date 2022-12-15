let input = Node.Fs.readFileAsUtf8Sync("src/day_8/test")->Js.String2.split("\n")
let _ = input->Js.Array2.pop

let trees =
  input
  ->Belt.Array.map(Js.String.split(""))
  ->Belt.Array.map(Js.Array.map(Belt.Int.fromString))
  ->Belt.Array.map(Js.Array.map(Belt.Option.getUnsafe))
