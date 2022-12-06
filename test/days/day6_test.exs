defmodule Aoc.Day6Test do
  use ExUnit.Case
  alias Aoc.Day6

  describe "Day 6" do
    test "returns the count of the number of characters before hitting 4 unique in a row" do
      assert Day6.part1(File.cwd!() <> "/test/data/day6.txt") == 7
    end

    test "returns the count of the number of characters before hitting 14 unique in a row" do
      assert Day6.part2(File.cwd!() <> "/test/data/day6.txt") == 19
    end
  end
end
