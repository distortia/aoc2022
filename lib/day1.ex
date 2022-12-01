defmodule Day1 do
  @moduledoc """
  We pass in data from the file, we need to parse it
  Each elf is "separated" by a blank line in the file

  We need to iterate over the lines and separate each elf into its own thing

  Is it better to pass the data into the func or have the func accept a file to stream? file

  how to determine when to separate the elves? after trimming the strings, we can use the "" as separation points
  ex: ["1000", "2000", "3000", "", "4000", "", "5000", "6000", "", "7000",
             "8000", "9000", "", "10000"]
  [["1000", "2000", "3000"], ["4000"], ["5000", "6000"], ["7000", "8000", "9000"], ["10000"]]
  then sum up each sub list
  [[5000], [4000], [11000], [24000], [10000]]
  """
  def part1(file) do
    file
    |> read_and_filter()
    |> Enum.max()
  end

  @doc """
  Part 2 asks for the sum of the top 3 elves instead of the top 1
  """
  def part2(file) do
    file
    |> read_and_filter()
    |> top_3_combined()
  end

  # how to determine top 3 counts?
  #  sort and take top 3 values
  defp top_3_combined(stream) do
    stream
    |> Enum.sort()
    |> Enum.slice(-3..-1)
    |> Enum.sum()
  end

  defp read_and_filter(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_by(fn line -> line == "" end)
    |> Stream.reject(fn i -> i == [""] end)
    |> Stream.map(fn list -> Enum.reduce(list, 0, fn i, acc -> String.to_integer(i) + acc end) end)
  end
end
