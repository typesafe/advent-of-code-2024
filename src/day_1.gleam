import gleam/dict
import gleam/int
import gleam/list
import gleam/string

pub fn part_1(input: List(String)) -> Int {
  input
  |> get_input_lists
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

pub fn part_2(input: List(String)) -> Int {
  let #(l, r) =
    input
    |> get_input_lists

  let right =
    r
    |> list.group(fn(i) { i })
    |> dict.map_values(fn(_k, v) { list.length(v) })

  l
  |> list.fold(0, fn(acc, i) {
    case dict.get(right, i) {
      Ok(v) -> acc + i * v
      _ -> acc
    }
  })
}

fn get_input_lists(input: List(String)) {
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
}
