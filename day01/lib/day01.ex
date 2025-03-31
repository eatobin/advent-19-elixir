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

  def answer_part_a(file) do
    make_modules(file)
    |> Enum.map(&gas/1)
    |> Enum.sum()
  end

  # Day01.answer_part_a("lib/day01.txt")
  # 3337766

  def gas_plus(module, acc \\ 0) do
    new_gas = gas(module)

    case new_gas do
      new_gas when new_gas <= 0 -> acc
      _ -> gas_plus(new_gas, acc + new_gas)
    end
  end

  def answer_part_b(file) do
    make_modules(file)
    |> Enum.map(&gas_plus/1)
    |> Enum.sum()
  end

  # Day01.answer_part_b("lib/day01.txt")
  # 5003788
end
