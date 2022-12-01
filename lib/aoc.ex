defmodule Aoc do
  @moduledoc """
  Documentation for `Aoc`.
  """

  alias Day1

  def day1_part1 do
    file = File.cwd!() <> "/data/day1.txt"
    Day1.part1(file)
  end

  def day1_part2 do
    file = File.cwd!() <> "/data/day1.txt"
    Day1.part2(file)
  end
end
