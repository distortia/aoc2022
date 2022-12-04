defmodule Aoc.Day4Test do
  use ExUnit.Case
  alias Aoc.Day4

  describe "Day 4" do
    test "returns the number of pairs where their range fully overlaps their partner" do
      assert Day4.part1(File.cwd!() <> "/test/data/day4.txt") == 2
    end

    test "returns the number of pairs where there is any overlap" do
      assert Day4.part2(File.cwd!() <> "/test/data/day4.txt") == 4
    end
  end
end
