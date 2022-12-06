defmodule Aoc.Day5Test do
  use ExUnit.Case
  alias Aoc.Day5

  @test_stacks [["N", "Z"], ["D", "C", "M"], ["P"]]

  describe "Day 5" do
    test "returns a string of the topmost elements of each stack" do
      assert Day5.part1(File.cwd!() <> "/test/data/day5.txt", @test_stacks) == "CMZ"
    end

    test "returns a string of the topmost elements of each stack part2" do
      assert Day5.part2(File.cwd!() <> "/test/data/day5.txt", @test_stacks) == "MCD"
    end
  end
end
