defmodule Aoc.Day2 do
  @moduledoc """
  Iterate over all the items and evaluate the total for the round

  Shape translation values
  rock(A)(X)     -> 1
  paper(B)(Y)    -> 2
  scissors(C)(Z) -> 3
  win            -> 6
  loss           -> 0
  draw           -> 3

  Part 2 guide
  X -> lose
  Y -> draw
  Z -> win
  """

  alias Aoc.IO

  def part1(file) do
    file
    |> IO.read()
    |> filter()
    |> convert(0)
  end

  defp convert([], total), do: total

  defp convert([head | tail], total) do
    value = translate(head)
    total = total + value
    convert(tail, total)
  end

  # paper vs rock(loss)
  defp translate(["B", "X"]), do: rock() + loss()
  # rock vs rock(draw)
  defp translate(["A", "X"]), do: rock() + draw()
  # scissor vs rock(win)
  defp translate(["C", "X"]), do: rock() + win()
  # scissor vs paper(loss)
  defp translate(["C", "Y"]), do: paper() + loss()
  # paper vs paper(draw)
  defp translate(["B", "Y"]), do: paper() + draw()
  # rock vs paper(win)
  defp translate(["A", "Y"]), do: paper() + win()
  # rock vs scissor(loss)
  defp translate(["A", "Z"]), do: scissors() + loss()
  # scissor vs scissor(draw)
  defp translate(["C", "Z"]), do: scissors() + draw()
  # paper vs scissor(win)
  defp translate(["B", "Z"]), do: scissors() + win()

  def part2(file) do
    file
    |> IO.read()
    |> filter()
    |> win_lose_draw(0)
  end

  defp win_lose_draw([], total), do: total

  defp win_lose_draw([head | tail], total) do
    value = calculate(head)
    total = total + value
    win_lose_draw(tail, total)
  end

  # Lose vs rock - calling scissors
  defp calculate(["A", "X"]), do: scissors() + loss()
  # Draw vs rock - calling rock
  defp calculate(["A", "Y"]), do: rock() + draw()
  # Win vs rock - calling paper
  defp calculate(["A", "Z"]), do: paper() + win()
  # Lose vs paper - calling rock
  defp calculate(["B", "X"]), do: rock() + loss()
  # Draw vs paper - calling paper
  defp calculate(["B", "Y"]), do: paper() + draw()
  # Win vs paper - calling scissors
  defp calculate(["B", "Z"]), do: scissors() + win()
  # Lose vs scissors - calling paper
  defp calculate(["C", "X"]), do: paper() + loss()
  # Draw vs scissors - calling scissors
  defp calculate(["C", "Y"]), do: scissors() + draw()
  # Win vs scissors - calling rock
  defp calculate(["C", "Z"]), do: rock() + win()

  defp rock(), do: 1
  defp paper(), do: 2
  defp scissors(), do: 3
  defp win(), do: 6
  defp draw(), do: 3
  defp loss(), do: 0

  defp filter(stream) do
    stream
    |> Stream.map(fn pair -> String.split(pair, " ", trim: true) end)
    |> Enum.to_list()
  end
end
