defmodule Aoc.Day4 do
  @moduledoc """
  Day4:

  Part1:
  In how many assignment pairs does one range fully contain the other?

  Data comes pairs of ranges, one for each elf: 1-2,3-4
  We need to convert these into actual ranges: [1..2, 3..4]
  We can subtract the lists and see if there are elements missing
    Example: [1,2,3] -- [2,3] = [1]; [2,3] -- [1,2,3] = []
    This means that we have a a complete overlap and we need to add that to our accumulator

  Part2:
  In how many assignment pairs do the ranges overlap?

  If we can keep the lists of ranges, we can use Range.disjoint?() to determine if there is any overlap
  Or we can subtract the lists and compare sizes
  """

  alias Aoc.IO

  def part1(file) do
    file
    |> IO.read()
    |> filter()
    |> overlap(0)
  end

  def part2(file) do
    file
    |> IO.read()
    |> filter_range()
    |> disjointed(0)
  end

  defp overlap([], acc), do: acc

  defp overlap([[first, second] | tail], acc) do
    acc =
      if first -- second == [] or second -- first == [] do
        acc + 1
      else
        acc
      end

    overlap(tail, acc)
  end

  defp disjointed([], acc), do: acc

  defp disjointed([[first, second] | tail], acc) do
    acc =
      if Range.disjoint?(first, second) do
        acc
      else
        acc + 1
      end

    disjointed(tail, acc)
  end

  defp filter(stream) do
    stream
    |> Stream.map(fn line ->
      [first, second] = String.split(line, ",", trim: true)
      first_range = convert_to_list(first)
      second_range = convert_to_list(second)
      [first_range, second_range]
    end)
    |> Enum.to_list()
  end

  defp filter_range(stream) do
    stream
    |> Stream.map(fn line ->
      [first, second] = String.split(line, ",", trim: true)
      first_range = convert_to_range(first)
      second_range = convert_to_range(second)
      [first_range, second_range]
    end)
    |> Enum.to_list()
  end

  defp convert_to_list(string) do
    string
    |> String.split("-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> (fn [start, stop] -> start |> Range.new(stop) |> Enum.to_list() end).()
  end

  defp convert_to_range(string) do
    string
    |> String.split("-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> (fn [start, stop] -> Range.new(start, stop) end).()
  end
end
