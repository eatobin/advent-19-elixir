defmodule Day01 do
  import(PersistentVector)

  @my_modules [
    68958,
    82218,
    54333,
    59177,
    51874,
    100_259,
    95468,
    124_006,
    75078,
    113_631,
    90315,
    147_580,
    68233,
    81025,
    133_084,
    90959,
    81196,
    92443,
    124_832,
    65871,
    57704,
    140_203,
    113_053,
    76337,
    72195,
    115_917,
    87843,
    131_768,
    105_816,
    131_153,
    59714,
    94107,
    50933,
    139_545,
    94969,
    149_463,
    60042,
    66028,
    111_190,
    63257,
    50020,
    88783,
    81428,
    73977,
    149_240,
    137_152,
    74738,
    55067,
    128_829,
    56465,
    81962,
    67242,
    94121,
    92303,
    68477,
    88595,
    64324,
    82527,
    134_717,
    140_344,
    132_026,
    137_558,
    95643,
    79010,
    146_346,
    86246,
    52341,
    147_564,
    89159,
    66456,
    83190,
    128_675,
    130_658,
    122_857,
    134_538,
    122_151,
    133_900,
    117_462,
    117_791,
    139_254,
    86366,
    66165,
    92897,
    121_218,
    135_962,
    143_061,
    129_220,
    114_623,
    98257,
    76722,
    121_014,
    77713,
    137_858,
    133_282,
    103_595,
    118_981,
    149_137,
    101_141,
    70765,
    141_113
  ]

  def gas(module) do
    div(module, 3) - 2
  end

  def answer_part_a() do
    @my_modules
    |> Enum.map(&gas/1)
    |> Enum.sum()
  end

  # Day01.answer_part_a()
  # 3337766

  def gas_plus(module, acc \\ 0) do
    new_gas = gas(module)

    case new_gas do
      new_gas when new_gas <= 0 -> acc
      _ -> gas_plus(new_gas, acc + new_gas)
    end
  end

  def answer_part_b() do
    @my_modules
    |> Enum.map(&gas_plus/1)
    |> Enum.sum()
  end

  # Day01.answer_part_b()
  # 5003788

  def my_test() do
    v = new(1..7)
    get(v, 0)
    set(v, 1, :two)
  end
end

# PersistentVector<count: 7, [1, 2, 3, 4, 5, 6, 7]>
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
