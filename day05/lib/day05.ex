defmodule Intcode do
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

  @offset_c 1
  @offset_b 2
  @offset_a 3

  def pad5(op) do
    char_list =
      op
      |> Integer.to_string()
      |> String.pad_leading(5, "0")
      |> String.to_charlist()

    for i <- char_list, into: Aja.Vector.new(), do: i - 48
  end

  def a_param(instruction, pointer, memory) do
    case instruction[0] do
      # a-p-w
      0 -> memory[pointer + @offset_a]
      _ -> "Invalid a_param"
    end
  end

  def b_param(instruction, pointer, memory) do
    case instruction[1] do
      # b-p-r
      0 -> memory[memory[pointer + @offset_b]]
      # b-i-r
      1 -> memory[pointer + @offset_b]
      _ -> "Invalid a_param"
    end
  end

  def c_param(instruction, pointer, memory) do
    if instruction[4] == 3 do
      case instruction[2] do
        # c-p-w
        0 -> memory[pointer + @offset_c]
        _ -> "Invalid a_param"
      end
    else
      case instruction[2] do
        # c-p-r
        0 -> memory[memory[pointer + @offset_c]]
        # c-i-r
        1 -> memory[pointer + @offset_c]
        _ -> "Invalid a_param"
      end
    end
  end

  def opcode(intcode) do
    instruction = Day05.pad5(intcode.memory[intcode.pointer])

    case instruction[4] do
      1 ->
        opcode(%{
          intcode
          | pointer: intcode.pointer + 4,
            memory:
              replace_at(
                intcode.memory,
                a_param(instruction, intcode.pointer, intcode.memory),
                c_param(instruction, intcode.pointer, intcode.memory) +
                  b_param(instruction, intcode.pointer, intcode.memory)
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

      9 ->
        intcode

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
