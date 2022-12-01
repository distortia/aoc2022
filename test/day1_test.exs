defmodule Day1Test do
  use ExUnit.Case
  alias Day1

  describe "Day1" do
    test "part 1 returns the calorie count for the elf with the highest amount of calories carried" do
      file = File.cwd!() <> "/test/data/day1.txt"
      assert Day1.part1(file) == 24_000
    end

    test "part 2 returns the calorie counts for the top 3 elves with the highest amount of calories carried" do
      file = File.cwd!() <> "/test/data/day1.txt"
      assert Day1.part2(file) == 45_000
    end
  end
end
