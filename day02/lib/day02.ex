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
  defstruct [:pointer, :memory]
end

defmodule Day02 do
  import(PersistentVector)
  require Intcode
  @memory_list Intcode.memory_list()

  def opcode(intcode) do
    case intcode.memory[intcode.pointer] do
      99 ->
        intcode

      1 ->
        opcode(%{
          intcode
          | pointer: intcode.pointer + 4,
            memory:
              set(
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
              set(
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
    set(ic.memory, 1, noun) |> set(2, verb)
  end

  def answer_a() do
    Day02.opcode(%Intcode{pointer: 0, memory: updated_memory(12, 2)}).memory[0]
    # Answer = 2890696
  end
end

# iex(1)> import(PersistentVector)
