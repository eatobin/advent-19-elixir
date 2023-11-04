def large() do
  {:ok, csv} = File.read("day02.csv")

  [head | _tail] =
    csv
    |> String.trim_trailing()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)

  head
end
