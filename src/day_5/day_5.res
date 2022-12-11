let input =
  Node.Fs.readFileAsUtf8Sync("src/day_5/test")
  ->Js.String2.split("\n")
  ->Belt.Array.keep(e => e != "")

let packages = input->Belt.Array.slice(~offset=0, ~len=3)
let action = input->Belt.Array.getUnsafe(3)
let action = input->Belt.Array.slice(~offset=4, ~len=1)
Belt.MutableStack.pop
