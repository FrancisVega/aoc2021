require AOCUtils

defmodule Day01 do
  @path './files/input01.txt'

  defp check_increased(item, acc) do
    [a, b] = item
    count = if a < b, do: 1, else: 0
    acc + count
  end

  defp count_increased(measurements) do
    measurements
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, &check_increased/2)
  end

  defp count_increased_three(measurements) do
    measurements
    |> Enum.chunk_every(3, 1)
    |> Enum.map(&Enum.sum/1)
    |> count_increased
  end

  def solution1 do
    AOCUtils.readInputFileAsIntegers(@path)
    |> count_increased
  end

  def solution2 do
    AOCUtils.readInputFileAsIntegers(@path)
    |> count_increased_three
  end
end
