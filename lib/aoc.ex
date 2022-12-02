defmodule Aoc do
  @moduledoc """
  Documentation for `Aoc`.
  """

  alias Aoc.Day1
  alias Aoc.Day2

  def day1_part1 do
    Day1.part1(File.cwd!() <> "/data/day1.txt")
  end

  def day1_part2 do
    Day1.part2(File.cwd!() <> "/data/day1.txt")
  end

  def day2_part1 do
    Day2.part1(File.cwd!() <> "/data/day2.txt")
  end

  def day2_part2 do
    Day2.part2(File.cwd!() <> "/data/day2.txt")
  end
end
