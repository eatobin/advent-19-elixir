defmodule Intcode do
  @memory_list [1002, 4, 3, 4, 33]

  defmacro memory_list, do: @memory_list
  defstruct [:input, :output, :pointer, :memory]
end

# Instruction:
# ABCDE
# 01234
# 01002
# 34 - two-digit opcode,      02 == opcode 2
#  2 - mode of 1st parameter,  0 == position mode
#  1 - mode of 2nd parameter,  1 == immediate mode
#  0 - mode of 3rd parameter,  0 == position mode,
#                                   omitted due to being a leading zero
# 0 1 or 2 = left-to-right position after 2 digit opcode
# p i or r = position, immediate or relative mode
# r or w = read or write

defmodule Day05 do
  import Aja.Vector
  require Intcode
  @memory_list Intcode.memory_list()

  # offsetC = 1
  # offsetB = 2
  # offsetA = 3

  def pad5(op) do
    char_list =
      op
      |> Integer.to_string()
      |> String.pad_leading(5, "0")
      |> String.to_charlist()

    for i <- char_list, into: Aja.Vector.new(), do: i - 48
  end

  def opcode(intcode) do
    case intcode.memory[intcode.pointer] do
      99 ->
        intcode

      1 ->
        opcode(%{
          intcode
          | pointer: intcode.pointer + 4,
            memory:
              replace_at(
                intcode.memory,
                intcode.memory[intcode.pointer + 3],
                intcode.memory[intcode.memory[intcode.pointer + 1]] +
                  intcode.memory[intcode.memory[intcode.pointer + 2]]
              )
        })

      2 ->
        opcode(%{
          intcode
          | pointer: intcode.pointer + 4,
            memory:
              replace_at(
                intcode.memory,
                intcode.memory[intcode.pointer + 3],
                intcode.memory[intcode.memory[intcode.pointer + 1]] *
                  intcode.memory[intcode.memory[intcode.pointer + 2]]
              )
        })

      _ ->
        "Invalid opcode"
    end
  end

  def updated_memory(noun, verb) do
    ic = %Intcode{pointer: 0, memory: new(@memory_list)}
    replace_at(ic.memory, 1, noun) |> replace_at(2, verb)
  end

  def answer_a() do
    Day05.opcode(%Intcode{pointer: 0, memory: updated_memory(12, 2)}).memory[0]
  end

  # Answer = 2890696

  def answer_b() do
    for noun <- 0..99,
        verb <- 0..99,
        Day05.opcode(%Intcode{pointer: 0, memory: updated_memory(noun, verb)}).memory[0] ==
          19_690_720 do
      100 * noun + verb
    end
  end

  # Answer = 8226
end
