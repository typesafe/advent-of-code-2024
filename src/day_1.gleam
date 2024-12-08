import gleam/int
import gleam/list
import gleam/string

pub fn part_1(input: List(String)) -> Int {
  input
  |> list.map(fn(line) {
    line
    |> string.split("   ")
    |> list.map(fn(s) {
      let assert Ok(i) = int.parse(s)
      i
    })
  })
  |> list.map(fn(pair) {
    case pair {
      [left, right] -> #(left, right)
      _ -> panic as "parse error"
    }
  })
  |> list.unzip()
  |> fn(p) {
    let #(l, r) = p
    list.zip(list.sort(l, int.compare), list.sort(r, int.compare))
  }
  |> list.map(fn(pair) {
    let #(a, b) = pair
    int.absolute_value(a - b)
  })
  |> int.sum()
}
