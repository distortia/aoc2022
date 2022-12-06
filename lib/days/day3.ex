defmodule Aoc.Day3 do
  @moduledoc """
  Rucksacks

  Determine which item exists in both lists and get the value of it

  Notes:
  Each rucksack has the same number of items for each compartment(same size list divided in half)


  Priorities
  Lowercase item types a through z have priorities 1 through 26.
  Uppercase item types A through Z have priorities 27 through 52.

  Part1:
  Determine the highest priority item amongst the rucksacks and sum their values

  Part2:
  Determine the item that is the same across 3 rucksacks and sum their values
  Note: we dont have to split each rucksack between compartments like Part 1
  """

  @lowercase %{
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26
  }
  @uppercase %{
    "A" => 27,
    "B" => 28,
    "C" => 29,
    "D" => 30,
    "E" => 31,
    "F" => 32,
    "G" => 33,
    "H" => 34,
    "I" => 35,
    "J" => 36,
    "K" => 37,
    "L" => 38,
    "M" => 39,
    "N" => 40,
    "O" => 41,
    "P" => 42,
    "Q" => 43,
    "R" => 44,
    "S" => 45,
    "T" => 46,
    "U" => 47,
    "V" => 48,
    "W" => 49,
    "X" => 50,
    "Y" => 51,
    "Z" => 52
  }

  alias Aoc.IO

  def part1(file) do
    file
    |> IO.read()
    |> filter()
    |> prioritize(0)
  end

  def part2(file) do
    file
    |> IO.read()
    |> filter()
    |> Enum.chunk_every(3)
    |> prioritize3(0)
  end

  # take lists of lists and determine the highest priority item exists in both
  defp prioritize([], sum), do: sum

  defp prioritize([head | tail], sum) do
    splitter = div(length(head), 2)
    {first, second} = Enum.split(head, splitter)
    sum = sum + max(first, second, 0)
    prioritize(tail, sum)
  end

  # comes in as 3 lists
  defp prioritize3([], sum), do: sum

  defp prioritize3([head | tail], sum) do
    [list1, list2, list3] = head
    sum = sum + max(list1, list2, list3, 0)
    prioritize3(tail, sum)
  end

  defp max([], _right, acc), do: acc

  defp max([h | tail], right, acc) do
    acc =
      if h in right and h > acc do
        h
      else
        acc
      end

    max(tail, right, acc)
  end

  defp max([], _middle, _right, acc), do: acc

  defp max([h1 | tail1], list2, list3, acc) do
    acc =
      if h1 in list2 and h1 in list3 and h1 > acc do
        h1
      else
        acc
      end

    max(tail1, list2, list3, acc)
  end

  defp filter(stream) do
    stream
    |> Stream.map(&String.graphemes/1)
    |> Stream.map(fn list ->
      list
      |> Enum.map(&convert/1)
    end)
    |> Enum.to_list()
  end

  defp convert(char) do
    case @lowercase[char] do
      nil -> @uppercase[char]
      value -> value
    end
  end
end
