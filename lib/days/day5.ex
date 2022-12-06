defmodule Aoc.Day5 do
  @moduledoc """
  Day5: Supply Stacks

  Use the stacks given and perform each instruction on the stacks

  [N]             [R]             [C]
  [T] [J]         [S] [J]         [N]
  [B] [Z]     [H] [M] [Z]         [D]
  [S] [P]     [G] [L] [H] [Z]     [T]
  [Q] [D]     [F] [D] [V] [L] [S] [M]
  [H] [F] [V] [J] [C] [W] [P] [W] [L]
  [G] [S] [H] [Z] [Z] [T] [F] [V] [H]
  [R] [H] [Z] [M] [T] [M] [T] [Q] [W]
  1   2   3   4   5   6   7   8   9

  Idea: keep a list of lists and use head|tail operations to add/subtract items
  We need to keep track of how many crates to move(call it `moves`)
  and starting(`start_stack`) and ending stack(`end_stack`)
  as well as the new stacks

  Ill read the moves from the file but dont want to attempt to dissect the stacks

  Moves can be represented by splitting the string into parts: {move, start_start, end_stack}
  We can pattern match each element in the tuple and recursively call our `move` function

  We need to find the top of each stack and combine those into a single output

  Note: Stack count starts at 1

  Part2: Moves the entirety of the moves from start_stack to end_stack instead of 1 at a time
  """

  alias Aoc.IO

  @stacks [
    ["N", "T", "B", "S", "Q", "H", "G", "R"],
    ["J", "Z", "P", "D", "F", "S", "H"],
    ["V", "H", "Z"],
    ["H", "G", "F", "J", "Z", "M"],
    ["R", "S", "M", "L", "D", "C", "Z", "T"],
    ["J", "Z", "H", "V", "W", "T", "M"],
    ["Z", "L", "P", "F", "T"],
    ["S", "W", "V", "Q"],
    ["C", "N", "D", "T", "M", "L", "H", "W"]
  ]

  def part1(file, stacks \\ @stacks) do
    file
    |> IO.read()
    |> filter()
    |> move_pieces(stacks)
    |> combine()
  end

  defp move_pieces([], stacks), do: stacks

  defp move_pieces([[moves, stack_start, stack_end] | tail], stacks) do
    stacks = move(stack_start, stack_end, stacks, moves)
    move_pieces(tail, stacks)
  end

  defp move(_stack_start, _stack_end, stacks, 0), do: stacks

  defp move(stack_start, stack_end, stacks, moves_left) do
    index_start = stack_start - 1
    index_end = stack_end - 1

    [to_move | rest_of_stack] = Enum.at(stacks, index_start)
    stack_to_move_to = Enum.at(stacks, index_end)

    updated_stacks =
      stacks
      |> List.replace_at(index_start, rest_of_stack)
      |> List.replace_at(index_end, [to_move | stack_to_move_to])

    move(stack_start, stack_end, updated_stacks, moves_left - 1)
  end

  defp combine(stacks) do
    stacks
    |> Enum.map_join(fn [head | _tail] -> head end)
  end

  def part2(file, stacks \\ @stacks) do
    file
    |> IO.read()
    |> filter()
    |> move_chunks(stacks)
    |> combine()
  end

  defp move_chunks([], stacks), do: stacks

  defp move_chunks([[moves, stack_start, stack_end] | tail], stacks) do
    stacks = move_chunk(moves, stack_start, stack_end, stacks)
    move_chunks(tail, stacks)
  end

  defp move_chunk(moves, stack_start, stack_end, stacks) do
    index_start = stack_start - 1
    index_end = stack_end - 1
    starting_stack = Enum.at(stacks, index_start)
    ending_stack = Enum.at(stacks, index_end)

    {items_to_move, rest_of_starting_stack} = Enum.split(starting_stack, moves)
    ending_stack = items_to_move ++ ending_stack

    stacks
    |> List.replace_at(index_start, rest_of_starting_stack)
    |> List.replace_at(index_end, ending_stack)
  end

  defp filter(stream) do
    stream
    |> Stream.map(&convert/1)
    |> Enum.to_list()
  end

  # take move 3 from 9 to 7
  # and convert to [3, 9, 7]
  # is it better to regex for numbers? nah lol
  defp convert(line) do
    line
    |> String.split(["move ", " from ", " to "], trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
