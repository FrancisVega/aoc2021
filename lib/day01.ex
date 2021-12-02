require AOCUtils

defmodule DAY01 do
  @path './files/input01.txt'

  defp check_increased(item, acc) do
    {accItem, accCounter} = acc
    incremente = if item > accItem, do: 1, else: 0
    {item, accCounter + incremente}
  end

  defp count_increased(measurements) do
    {_, increased} =
      measurements
      |> Enum.reduce({nil, 0}, &check_increased/2)

    increased
  end

  defp count_increased_sum_of_three(measurements) do
    measurements
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1)
    |> Enum.map(&Enum.sum/1)
    |> count_increased
  end

  def solution1 do
    AOCUtils.readInputFile(@path)
    |> count_increased
  end

  def solution2 do
    AOCUtils.readInputFile(@path)
    |> count_increased_sum_of_three
  end
end
