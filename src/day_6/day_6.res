let input = "bvwbjplbgvbhsrlpgdmjqwftvncz"

input
->Js.String2.("")
->Belt.Array.reduceWithIndex(Belt.MutableMap.String.make(), (acc, cur, i) => {
  switch acc->Belt.MutableMap.String.get(cur) {
  | None => acc->Belt.MutableMap.String.set(cur, i)
  | Some(e) => {
      acc->Belt.MutableMap.String.forEach((k, v) => {
	      if v<=e {
		      acc->Belt.MutableMap.
	      }
      })
      acc->Belt.MutableMap.String.set(cur, i)
    }
  }
  acc
})
->Js.log
