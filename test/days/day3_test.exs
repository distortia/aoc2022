defmodule Aoc.Day3Test do
  use ExUnit.Case
  alias Aoc.Day3

  describe "Day 3" do
    test "returns the sum of the priorities of the rucksacks" do
      assert Day3.part1(File.cwd!() <> "/test/data/day3.txt") == 157
    end

    test "returns the sum of the priorities across each trio of rucksacks" do
      assert Day3.part2(File.cwd!() <> "/test/data/day3.txt") == 70
    end
  end
end
