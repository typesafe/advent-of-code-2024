import gleeunit/should
import input

import day_1

pub fn day_1_part_1_test() {
  let assert Ok(lines) = input.read_lines(1)

  day_1.part_1(lines)
  |> should.equal(2_580_760)
}
