/* let input = Node_fs.readFileAsUtf8Sync("src/day_6/input") */
let input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

input->Js.String2.length->Js.log

input
->Js.String2.split("")
->Belt.Array.reduceWithIndex(Belt.MutableMap.String.make(), (acc, cur, i) => {
  if acc->Belt.MutableMap.String.size < 20 {
    switch acc->Belt.MutableMap.String.get(cur) {
    | None => acc->Belt.MutableMap.String.set(cur, i)
    | Some(e) => {
        acc->Belt.MutableMap.String.forEach((k, v) => {
          if v <= e {
            acc->Belt.MutableMap.String.remove(k)
          }
        })
        acc->Belt.MutableMap.String.set(cur, i)
      }
    }
  }
  acc
})
->Belt.MutableMap.String.size
/* ->Belt.MutableMap.String.reduce(min_int, (acc, _, v) => Js.Math.max_int(acc, v)) */
->Js.log
