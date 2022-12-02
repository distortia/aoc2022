defmodule Aoc.Day2Test do
  use ExUnit.Case
  alias Aoc.Day2

  describe "Day 2" do
    test "returns the sum of the values of the outcomes" do
      assert Day2.part1(File.cwd!() <> "/test/data/day2.txt") == 15
    end

    test "returns the sum of the values of the outcomes based on new guide" do
      assert Day2.part2(File.cwd!() <> "/test/data/day2.txt") == 12
    end
  end
end
