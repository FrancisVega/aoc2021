require AOCUtils

defmodule DAY01 do
  @path './files/input01.txt'

  defp checkIncreased(item, acc) do
    {accItem, accCounter} = acc
    incremente = if item > accItem, do: 1, else: 0
    {item, accCounter + incremente}
  end

  defp mainPart1(measurements) do
    {_, increased} =
      measurements
      |> Enum.reduce({nil, 0}, fn item, acc -> checkIncreased(item, acc) end)

    increased
  end

  defp mainPart2(measurements) do
    measurements
  end

  def solution1 do
    AOCUtils.readInputFile(@path)
    |> mainPart1
  end

  def solution2 do
    AOCUtils.readInputFile(@path)
    |> mainPart2
  end
end
