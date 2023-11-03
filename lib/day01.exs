defmodule Day01 do
  def haiku() do
    {:ok, contents} = File.read("day01.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def large() do
    {:ok, csv} = File.read("day02.csv")

    [head | _tail] =
      csv
      |> String.trim_trailing()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    head
  end
end

# iex(3)> c "lib/day01.exs"
# [Haiku]
# iex(4)> Day01.haiku
# iex(9)> r Day01
