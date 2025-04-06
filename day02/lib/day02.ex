defmodule Memory_List do
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

  defmacro memory_list, do: @memory_list
end

defmodule Intcode do
  defstruct [:pointer, :memory]
end

defmodule Day02 do
  import(PersistentVector)
  require Memory_List
  @memory_list Memory_List.memory_list()

  def make_intcode do
    %Intcode{pointer: 0, memory: new(@memory_list)}
  end

  def my_test() do
    v = new(1..7)
    get(v, 0)
    set(v, 1, :two)
  end
end

# [eric@eric-minisforum day02](dev)$ iex -S mix
# Erlang/OTP 27 [erts-15.2.4] [source] [64-bit] [smp:20:20] [ds:20:20:10] [async-threads:1] [jit:ns]

# Compiling 1 file (.ex)
# Generated day02 app
# Interactive Elixir (1.18.3) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> require PersistentVector
# PersistentVector
# iex(2)> ic = Day02.make_intcode()
# %Intcode{
#   pointer: 0,
#   memory: #PersistentVector<count: 121, [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1,
#    5, 0, 3, 2, 10, 1, 19, 2, 9, 19, 23, 2, 13, 23, 27, 1, 6, 27, 31, 2, 6, 31,
#    35, 2, 13, 35, 39, 1, 39, 10, 43, 2, 43, 13, 47, ...]>
# }
# iex(3)> ic.pointer
# 0
# iex(4)> ic.memory[121]
# nil
# iex(5)> ic.memory[120]
# 0
# iex(6)> ic.memory[220]
# nil
# iex(7)>

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
