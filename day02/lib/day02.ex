defmodule Post do
  defstruct [:title, :content, :author]
end

defmodule Intcode do
  import(PersistentVector)

  @memory_list [
    1,
    0,
    0,
    3,
    1,
    1,
    2,
    3,
    1,
    3,
    4,
    3,
    1,
    5,
    0,
    3,
    2,
    10,
    1,
    19,
    2,
    9,
    19,
    23,
    2,
    13,
    23,
    27,
    1,
    6,
    27,
    31,
    2,
    6,
    31,
    35,
    2,
    13,
    35,
    39,
    1,
    39,
    10,
    43,
    2,
    43,
    13,
    47,
    1,
    9,
    47,
    51,
    1,
    51,
    13,
    55,
    1,
    55,
    13,
    59,
    2,
    59,
    13,
    63,
    1,
    63,
    6,
    67,
    2,
    6,
    67,
    71,
    1,
    5,
    71,
    75,
    2,
    6,
    75,
    79,
    1,
    5,
    79,
    83,
    2,
    83,
    6,
    87,
    1,
    5,
    87,
    91,
    1,
    6,
    91,
    95,
    2,
    95,
    6,
    99,
    1,
    5,
    99,
    103,
    1,
    6,
    103,
    107,
    1,
    107,
    2,
    111,
    1,
    111,
    5,
    0,
    99,
    2,
    14,
    0,
    0
  ]
  memory = new(@memory_list)
  post = %Post{title: "Hello world!"}
  # defstruct [:pointer, :memory]
  # anIntcode = %Intcode{pointer: 0, memory: memory}
end

defmodule Day02 do
  # import(PersistentVector)

  # def make_memory_map(file) do
  #   {:ok, csv} = File.read(file)

  #   values =
  #     csv
  #     |> String.trim_trailing()
  #     |> String.split(",")
  #     |> Enum.map(&String.to_integer/1)

  #   keys = Enum.to_list(0..(Enum.count(values) - 1))

  #   Enum.zip(keys, values) |> Enum.into(%{})
  # end

  # def my_test() do
  #   v = new(1..7)
  #   get(v, 0)
  #   set(v, 1, :two)
  # end

  # _memory = Day02.make_memory_map("lib/day02.csv")
  # Day02.make_memory_map("lib/day02.csv")
end

# import(PersistentVector)
# iex(2)> import(PersistentVector)
# PersistentVector
# iex(3)> v = new(1..10)
# #PersistentVector<count: 10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]>
# iex(4)> get(v,4)
# 5
# iex(5)> v
# #PersistentVector<count: 7, [1, 2, 3, 4, 5, 6, 7]>
# iex(6)> set(v, 1, :two)
# #PersistentVector<count: 7, [1, :two, 3, 4, 5, 6, 7]>
# iex(7)> v
# #PersistentVector<count: 7, [1, 2, 3, 4, 5, 6, 7]>
# iex(8)> v9 = set(v, 1, :two)
# #PersistentVector<count: 7, [1, :two, 3, 4, 5, 6, 7]>
# iex(9)> v
# #PersistentVector<count: 7, [1, 2, 3, 4, 5, 6, 7]>
# iex(10)> v9
# #PersistentVector<count: 7, [1, :two, 3, 4, 5, 6, 7]>
# iex(11)>
