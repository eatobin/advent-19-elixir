defmodule Intcode do
  @memory_list [
    3,
    225,
    1,
    225,
    6,
    6,
    1100,
    1,
    238,
    225,
    104,
    0,
    1102,
    79,
    14,
    225,
    1101,
    17,
    42,
    225,
    2,
    74,
    69,
    224,
    1001,
    224,
    -5733,
    224,
    4,
    224,
    1002,
    223,
    8,
    223,
    101,
    4,
    224,
    224,
    1,
    223,
    224,
    223,
    1002,
    191,
    83,
    224,
    1001,
    224,
    -2407,
    224,
    4,
    224,
    102,
    8,
    223,
    223,
    101,
    2,
    224,
    224,
    1,
    223,
    224,
    223,
    1101,
    18,
    64,
    225,
    1102,
    63,
    22,
    225,
    1101,
    31,
    91,
    225,
    1001,
    65,
    26,
    224,
    101,
    -44,
    224,
    224,
    4,
    224,
    102,
    8,
    223,
    223,
    101,
    3,
    224,
    224,
    1,
    224,
    223,
    223,
    101,
    78,
    13,
    224,
    101,
    -157,
    224,
    224,
    4,
    224,
    1002,
    223,
    8,
    223,
    1001,
    224,
    3,
    224,
    1,
    224,
    223,
    223,
    102,
    87,
    187,
    224,
    101,
    -4698,
    224,
    224,
    4,
    224,
    102,
    8,
    223,
    223,
    1001,
    224,
    4,
    224,
    1,
    223,
    224,
    223,
    1102,
    79,
    85,
    224,
    101,
    -6715,
    224,
    224,
    4,
    224,
    1002,
    223,
    8,
    223,
    1001,
    224,
    2,
    224,
    1,
    224,
    223,
    223,
    1101,
    43,
    46,
    224,
    101,
    -89,
    224,
    224,
    4,
    224,
    1002,
    223,
    8,
    223,
    101,
    1,
    224,
    224,
    1,
    223,
    224,
    223,
    1101,
    54,
    12,
    225,
    1102,
    29,
    54,
    225,
    1,
    17,
    217,
    224,
    101,
    -37,
    224,
    224,
    4,
    224,
    102,
    8,
    223,
    223,
    1001,
    224,
    3,
    224,
    1,
    223,
    224,
    223,
    1102,
    20,
    53,
    225,
    4,
    223,
    99,
    0,
    0,
    0,
    677,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1105,
    0,
    99999,
    1105,
    227,
    247,
    1105,
    1,
    99999,
    1005,
    227,
    99999,
    1005,
    0,
    256,
    1105,
    1,
    99999,
    1106,
    227,
    99999,
    1106,
    0,
    265,
    1105,
    1,
    99999,
    1006,
    0,
    99999,
    1006,
    227,
    274,
    1105,
    1,
    99999,
    1105,
    1,
    280,
    1105,
    1,
    99999,
    1,
    225,
    225,
    225,
    1101,
    294,
    0,
    0,
    105,
    1,
    0,
    1105,
    1,
    99999,
    1106,
    0,
    300,
    1105,
    1,
    99999,
    1,
    225,
    225,
    225,
    1101,
    314,
    0,
    0,
    106,
    0,
    0,
    1105,
    1,
    99999,
    107,
    226,
    226,
    224,
    1002,
    223,
    2,
    223,
    1006,
    224,
    329,
    101,
    1,
    223,
    223,
    1108,
    677,
    226,
    224,
    1002,
    223,
    2,
    223,
    1006,
    224,
    344,
    101,
    1,
    223,
    223,
    7,
    677,
    226,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    359,
    101,
    1,
    223,
    223,
    108,
    226,
    226,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    374,
    101,
    1,
    223,
    223,
    8,
    226,
    677,
    224,
    1002,
    223,
    2,
    223,
    1006,
    224,
    389,
    101,
    1,
    223,
    223,
    1108,
    226,
    226,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    404,
    101,
    1,
    223,
    223,
    1007,
    677,
    677,
    224,
    1002,
    223,
    2,
    223,
    1006,
    224,
    419,
    101,
    1,
    223,
    223,
    8,
    677,
    677,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    434,
    1001,
    223,
    1,
    223,
    1008,
    226,
    226,
    224,
    102,
    2,
    223,
    223,
    1005,
    224,
    449,
    1001,
    223,
    1,
    223,
    1008,
    226,
    677,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    464,
    101,
    1,
    223,
    223,
    1107,
    677,
    677,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    479,
    101,
    1,
    223,
    223,
    107,
    677,
    677,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    494,
    1001,
    223,
    1,
    223,
    1107,
    226,
    677,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    509,
    101,
    1,
    223,
    223,
    1108,
    226,
    677,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    524,
    101,
    1,
    223,
    223,
    7,
    226,
    226,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    539,
    101,
    1,
    223,
    223,
    108,
    677,
    677,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    554,
    101,
    1,
    223,
    223,
    8,
    677,
    226,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    569,
    1001,
    223,
    1,
    223,
    1008,
    677,
    677,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    584,
    101,
    1,
    223,
    223,
    107,
    226,
    677,
    224,
    102,
    2,
    223,
    223,
    1005,
    224,
    599,
    1001,
    223,
    1,
    223,
    7,
    226,
    677,
    224,
    102,
    2,
    223,
    223,
    1005,
    224,
    614,
    101,
    1,
    223,
    223,
    1007,
    226,
    226,
    224,
    1002,
    223,
    2,
    223,
    1005,
    224,
    629,
    101,
    1,
    223,
    223,
    1107,
    677,
    226,
    224,
    1002,
    223,
    2,
    223,
    1006,
    224,
    644,
    101,
    1,
    223,
    223,
    108,
    226,
    677,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    659,
    101,
    1,
    223,
    223,
    1007,
    677,
    226,
    224,
    102,
    2,
    223,
    223,
    1006,
    224,
    674,
    101,
    1,
    223,
    223,
    4,
    223,
    99,
    226
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
    end
  end

  def b_param(instruction, pointer, memory) do
    case instruction[1] do
      # b-p-r
      0 -> memory[memory[pointer + @offset_b]]
      # b-i-r
      1 -> memory[pointer + @offset_b]
    end
  end

  def c_param(instruction, pointer, memory) do
    if instruction[4] == 3 do
      case instruction[2] do
        # c-p-w
        0 -> memory[pointer + @offset_c]
      end
    else
      case instruction[2] do
        # c-p-r
        0 -> memory[memory[pointer + @offset_c]]
        # c-i-r
        1 -> memory[pointer + @offset_c]
      end
    end
  end

  def opcode(intcode) do
    # defstruct [:input, :output, :pointer, :memory]
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
                a_param(instruction, intcode.pointer, intcode.memory),
                c_param(instruction, intcode.pointer, intcode.memory) *
                  b_param(instruction, intcode.pointer, intcode.memory)
              )
        })

      3 ->
        opcode(%{
          intcode
          | pointer: intcode.pointer + 2,
            memory:
              replace_at(
                intcode.memory,
                c_param(instruction, intcode.pointer, intcode.memory),
                intcode.input
              )
        })

      4 ->
        opcode(%{
          intcode
          | pointer: intcode.pointer + 2,
            output: c_param(instruction, intcode.pointer, intcode.memory)
        })

      5 ->
        if c_param(instruction, intcode.pointer, intcode.memory) != 0 do
          opcode(%{
            intcode
            | pointer: b_param(instruction, intcode.pointer, intcode.memory)
          })
        else
          opcode(%{
            intcode
            | pointer: intcode.pointer + 3
          })
        end

      6 ->
        if c_param(instruction, intcode.pointer, intcode.memory) == 0 do
          opcode(%{
            intcode
            | pointer: b_param(instruction, intcode.pointer, intcode.memory)
          })
        else
          opcode(%{
            intcode
            | pointer: intcode.pointer + 3
          })
        end

      7 ->
        if c_param(instruction, intcode.pointer, intcode.memory) <
             b_param(instruction, intcode.pointer, intcode.memory) do
          opcode(%{
            intcode
            | pointer: intcode.pointer + 4,
              memory:
                replace_at(
                  intcode.memory,
                  a_param(instruction, intcode.pointer, intcode.memory),
                  1
                )
          })
        else
          opcode(%{
            intcode
            | pointer: intcode.pointer + 4,
              memory:
                replace_at(
                  intcode.memory,
                  a_param(instruction, intcode.pointer, intcode.memory),
                  0
                )
          })
        end

      8 ->
        if c_param(instruction, intcode.pointer, intcode.memory) ==
             b_param(instruction, intcode.pointer, intcode.memory) do
          opcode(%{
            intcode
            | pointer: intcode.pointer + 4,
              memory:
                replace_at(
                  intcode.memory,
                  a_param(instruction, intcode.pointer, intcode.memory),
                  1
                )
          })
        else
          opcode(%{
            intcode
            | pointer: intcode.pointer + 4,
              memory:
                replace_at(
                  intcode.memory,
                  a_param(instruction, intcode.pointer, intcode.memory),
                  0
                )
          })
        end

      9 ->
        intcode
    end
  end

  # defstruct [:input, :output, :pointer, :memory]

  def answer_a() do
    Day05.opcode(%Intcode{input: 1, output: 0, pointer: 0, memory: new(@memory_list)}).output
  end

  # Answer = 9025675

  def answer_b() do
    Day05.opcode(%Intcode{input: 5, output: 0, pointer: 0, memory: new(@memory_list)}).output
  end

  # Answer = 11981754
end
