# c "lib/day01.exs"
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

  # Day01.answer_part_a
  # 3337766
  def answer_part_a() do
    Enum.map(make_modules("resources/day01.txt"), &gas/1)
    |> Enum.sum()
  end

  def gas_plus(module, acc \\ 0) do
    new_gas = gas(module)

    case new_gas do
      new_gas when new_gas <= 0 -> acc
      _ -> gas_plus(new_gas, acc + new_gas)
    end
  end

  # Day01.answer_part_b
  # 5003788
  def answer_part_b() do
    Enum.map(make_modules("resources/day01.txt"), &gas_plus/1)
    |> Enum.sum()
  end
end
