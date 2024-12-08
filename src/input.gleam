import gleam/int
import gleam/string

import simplifile

pub fn read_lines(day: Int) -> Result(List(String), String) {
  let path = "input/day_" <> int.to_string(day) <> ".txt"
  case simplifile.read(path) {
    Ok(input) ->
      input
      |> string.trim()
      |> string.split("\n")
      |> Ok()
    Error(err) -> Error(simplifile.describe_error(err))
  }
}
