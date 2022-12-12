let input =
  Node.Fs.readFileAsUtf8Sync("src/day_5/test")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")

//delete [ and ] from the string
let formatPackage = s =>
  s
  ->Belt.Array.map(Js.String2.trim)
  ->Belt.Array.map(e =>
    Js.String2.split(e, "")
    ->Belt.Array.keep(e => e != "[" && e != "]")
    ->Belt.Array.reduce("", (acc, e) => acc ++ e)
  )
  ->Belt.Array.map(Js.String2.split(_, " "))

let packages = input->Belt.Array.slice(~offset=0, ~len=3)->formatPackage

let columns =
  input
  ->Belt.Array.getUnsafe(3)
  ->Js.String2.split(" ")
  ->Belt.Array.map(Js.String2.trim)
  ->Belt.Array.keep(e => e != "")

type action = {packages: string, from: string, to: string}

let actions = input->Belt.Array.sliceToEnd(4)->Belt.Array.map(Js.String2.split(" "))


Js.log(actions)
