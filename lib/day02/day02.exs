# c "lib/day02/day02.exs"
# r Day02
defmodule Day02 do
  def make_memory_map(file) do
    {:ok, csv} = File.read(file)

    values =
      csv
      |> String.trim_trailing()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    keys = Enum.to_list(0..120)

    Enum.zip(keys, values) |> Enum.into(%{})
  end

  # Day02.make_memory_map("lib/day02/day02.csv")
end
