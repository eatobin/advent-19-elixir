# c "lib/day02/day02.exs"
# r Day02
defmodule Day02 do
  def make_memory_map() do
    {:ok, csv} = File.read("lib/day02/day02.csv")

    values =
      csv
      |> String.trim_trailing()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    keys = Enum.to_list(0..10_000)

    Enum.zip(keys, values) |> Enum.into(%{})
  end
end
