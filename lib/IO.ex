defmodule Aoc.IO do
  @moduledoc """
  General Purpose File streaming context
  """

  def read(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
