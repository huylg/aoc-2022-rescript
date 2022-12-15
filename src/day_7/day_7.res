type file = {path: string, size: int}
type rec dir = {path: string, dirs: array<dir>, files: array<file>, parent: dir}

let rec root = {path: "/", files: [], dirs: [], parent: root}

let input = Node.Fs.readFileAsUtf8Sync("src/day_7/input")->Js.String2.split("\n")
let length = input->Belt.Array.length
let _ =
  input
  ->Belt.Array.slice(~offset=1, ~len=length - 2)
  ->Belt.Array.reduce(root, (pwd, line) => {
    let commandLine = line->Js.String2.split(" ")
    switch commandLine {
    | ["$", "cd", "/"] => root
    | ["$", "cd", ".."] => pwd.parent
    | ["$", "cd", path] => pwd.dirs->Belt.Array.getBy(d => d.path == path)->Belt.Option.getUnsafe
    | ["$", "ls"] => pwd
    | ["dir", path] => {
        let newDir = {path, dirs: [], files: [], parent: pwd}
        pwd.dirs->Belt.Array.push(newDir)
        pwd
      }

    | [size, path] => {
        let newFile = {path, size: size->Belt.Int.fromString->Belt.Option.getUnsafe}
        pwd.files->Belt.Array.push(newFile)
        pwd
      }

    | _ => pwd
    }
  })

let rec process = root => {
  let filesSize = root.files->Belt.Array.reduce(0, (acc, cur) => cur.size + acc)
  let (dirsSize, result) = root.dirs->Belt.Array.reduce((0, 0), ((size, result), cur) => {
    let (subSize, subResult) = process(cur)
    (size + subSize, result + subResult)
  })
  let total = filesSize + dirsSize
  if total <= 100000 {
    (total, total + result)
  } else {
    (total, result)
  }
}

let (_, result) = root->process

result->Js.log


