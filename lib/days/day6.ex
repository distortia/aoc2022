defmodule Aoc.Day6 do
  @moduledoc """
  Day 6: Tuning Trouble

  Part 1: How many characters need to be processed before the first start-of-packet marker is detected?

  Part 2: How many characters need to be processed before the first start-of-message marker is detected?
  Same as part 1 but needs 14 distinct characters

  Note: Data comes in as a single line
  """

  alias Aoc.IO

  def part1(file) do
    file
    |> IO.read()
    |> filter()
    |> decode_by([], 4)
  end

  def part2(file) do
    file
    |> IO.read()
    |> filter()
    |> decode_by([], 14)
  end

  defp decode_by([h | tail], current_list_seen, decode_by) do
    last_n_seen = Enum.take(current_list_seen, decode_by - 1)

    if unique_characters([h | last_n_seen], decode_by) do
      length(current_list_seen) + 1
    else
      decode_by(tail, [h | current_list_seen], decode_by)
    end
  end

  defp unique_characters(characters, unique_by) when length(characters) == unique_by,
    do: Enum.uniq(characters) == characters

  defp unique_characters(_characters, _unique_by), do: false

  defp filter(stream) do
    stream
    |> Enum.to_list()
    |> List.first()
    |> String.split("", trim: true)
  end
end
