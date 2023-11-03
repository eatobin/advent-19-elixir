defmodule Day01 do
  def make_modules(file) do
    {:ok, contents} = File.read(file)

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def gas(module) do
    div(module, 3) - 2
  end

  def answer_part_a() do
    Enum.map(make_modules("resources/day01.txt"), &gas/1)
    |> Enum.sum()
  end
end

# iex(1)> c "lib/day01.exs"
# [Day01]
# iex(2)> Day01.answer_part_a
# 3337766





# def large() do
#   {:ok, csv} = File.read("day02.csv")

#   [head | _tail] =
#     csv
#     |> String.trim_trailing()
#     |> String.split(",")
#     |> Enum.map(&String.to_integer/1)

#   head
# end
# end

# iex(3)> c "lib/day01.exs"
# [Haiku]
# iex(4)> Day01.haiku
# iex(9)> r Day01
