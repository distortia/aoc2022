defmodule Aoc do
  @moduledoc """
  Documentation for `Aoc`.
  """

  alias Aoc.Day1
  alias Aoc.Day2
  alias Aoc.Day3
  alias Aoc.Day4
  alias Aoc.Day5
  alias Aoc.Day6

  @doc ~S"""
  ## Examples

      iex> Aoc.day1_part1()
      68442

  """
  def day1_part1 do
    Day1.part1(File.cwd!() <> "/data/day1.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day1_part2()
      204837

  """
  def day1_part2 do
    Day1.part2(File.cwd!() <> "/data/day1.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day2_part1()
      9651

  """
  def day2_part1 do
    Day2.part1(File.cwd!() <> "/data/day2.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day2_part2()
      10560

  """
  def day2_part2 do
    Day2.part2(File.cwd!() <> "/data/day2.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day3_part1()
      7727

  """
  def day3_part1 do
    Day3.part1(File.cwd!() <> "/data/day3.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day3_part2()
      2609

  """
  def day3_part2 do
    Day3.part2(File.cwd!() <> "/data/day3.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day4_part1()
      441

  """
  def day4_part1 do
    Day4.part1(File.cwd!() <> "/data/day4.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day4_part2()
      861

  """
  def day4_part2 do
    Day4.part2(File.cwd!() <> "/data/day4.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day5_part1()
      "PTWLTDSJV"

  """
  def day5_part1 do
    Day5.part1(File.cwd!() <> "/data/day5.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day5_part2()
      "WZMFVGGZP"

  """
  def day5_part2 do
    Day5.part2(File.cwd!() <> "/data/day5.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day6_part1()
      1816

  """
  def day6_part1() do
    Day6.part1(File.cwd!() <> "/data/day6.txt")
  end

  @doc ~S"""
  ## Examples

      iex> Aoc.day6_part2()
      2625

  """
  def day6_part2 do
    Day6.part2(File.cwd!() <> "/data/day6.txt")
  end
end
