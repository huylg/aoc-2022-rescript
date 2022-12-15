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

let rec dirSize = root => {
  let filesSize = root.files->Belt.Array.reduce(0, (acc, cur) => cur.size + acc)
  let dirsSize = root.dirs->Belt.Array.reduce(0, (acc, cur) => acc + dirSize(cur))
  let total = filesSize + dirsSize
  total
}

let rootSize = root->dirSize

let requiredSize = rootSize + 30000000 - 70000000
requiredSize->Js.log

let rec findDir = root => {
  root.dirs->Belt.Array.flatMap(findDir)->Belt.Array.concat(root.dirs)
}

let rec ppDir = (root, level) => {
  Js.log4(
    Belt.Array.make(level, " ")->Belt.Array.joinWith("", Js.String2.make),
    "dir",
    root.path,
    root->dirSize,
  )
  root.files->Belt.Array.forEach(f => {
    Js.log4(
      Belt.Array.make(level + 1, " ")->Belt.Array.joinWith("", Js.String2.make),
      "file",
      f.path,
      f.size,
    )
  })
  root.dirs->Belt.Array.forEach(ppDir(_, level + 1))
}

/* root->ppDir(0) */

root
->findDir
->Belt.Array.keepMap(a => {
  let size = a->dirSize
  if size >= requiredSize {
    Some((a.path, size))
  } else {
    None
  }
})
->Belt.Array.reduce((root.path, rootSize), ((accPath, accSize), (curPath, curSize)) => {
  if curSize < accSize {
    (curPath, curSize)
  } else {
    (accPath, accSize)
  }
})
->Js.log
