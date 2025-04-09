defmodule Intcode do
  @memory_list [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]

  defmacro memory_list, do: @memory_list
  defstruct [:pointer, :memory]
end

defmodule Day02 do
  import(PersistentVector)
  require Intcode
  @memory_list Intcode.memory_list()

  def make_intcode do
    %Intcode{pointer: 0, memory: new(@memory_list)}
  end

  def my_test() do
    v = new(1..7)
    get(v, 0)
    set(v, 1, :two)
  end

  def test2({x, y, z}) do
    case {x, y, z} do
      {4, 5, 6} -> "4, 5, 6"
      {1, g, 3} -> g * 9
      _ -> "This clause would match any value"
    end
  end

  def test3(r) do
    case r do
      1 -> "This is a one"
      2 -> "This is a two"
      _ -> "This is anything else"
    end
  end

  def opcode(intcode) do
    case intcode.memory[intcode.pointer] do
      99 ->
        intcode

      1 ->
        %{
          intcode
          | pointer: intcode.pointer + 4,
            memory:
              set(
                intcode.memory,
                intcode.memory[3],
                intcode.memory[intcode.memory[1]] + intcode.memory[intcode.memory[2]]
              )
        }

      2 ->
        %{
          intcode
          | pointer: intcode.pointer + 4,
            memory:
              set(
                intcode.memory,
                intcode.memory[3],
                intcode.memory[intcode.memory[1]] * intcode.memory[intcode.memory[2]]
              )
        }

      _ ->
        "Invalid opcode"
    end
  end
end

defmodule Recursion do
  def print_multiple_times(_msg, 0) do
    :ok
  end

  def print_multiple_times(msg, n) do
    IO.puts(msg)
    IO.puts(n)
    print_multiple_times(msg, n - 1)
  end
end

# Recursion.print_multiple_times("Hello!", 3)
# # Hello!
# # Hello!
# # Hello!
# :ok

# [eric@eric-minisforum day02](dev)$ iex -S mix
# Erlang/OTP 27 [erts-15.2.4] [source] [64-bit] [smp:20:20] [ds:20:20:10] [async-threads:1] [jit:ns]

# Compiling 1 file (.ex)
# Generated day02 app
# Interactive Elixir (1.18.3) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> import(PersistentVector)
# PersistentVector
# iex(2)> ic = Day02.make_intcode()
# %Intcode{
#   pointer: 0,
#   memory: #PersistentVector<count: 121, [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1,
#    5, 0, 3, 2, 10, 1, 19, 2, 9, 19, 23, 2, 13, 23, 27, 1, 6, 27, 31, 2, 6, 31,
#    35, 2, 13, 35, 39, 1, 39, 10, 43, 2, 43, 13, 47, ...]>
# }
# iex(3)> ic.memory[3]
# 3
# iex(4)> get(ic.memory,3)
# 3
# iex(5)> set(ic.memory,3,44)
# #PersistentVector<count: 121, [1, 0, 0, 44, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3,
#  2, 10, 1, 19, 2, 9, 19, 23, 2, 13, 23, 27, 1, 6, 27, 31, 2, 6, 31, 35, 2, 13,
#  35, 39, 1, 39, 10, 43, 2, 43, 13, 47, 1, 9, ...]>
# iex(6)> ic.memory[3]
# 3
# iex(7)> ic2 = set(ic.memory,3,44)
# #PersistentVector<count: 121, [1, 0, 0, 44, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3,
#  2, 10, 1, 19, 2, 9, 19, 23, 2, 13, 23, 27, 1, 6, 27, 31, 2, 6, 31, 35, 2, 13,
#  35, 39, 1, 39, 10, 43, 2, 43, 13, 47, 1, 9, ...]>
# iex(8)> ic2[3]
# 44
# iex(9)>
