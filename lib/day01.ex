require AOCUtils

defmodule DAY01 do
  @path './files/input01.txt'

  defp isGreater(a, b) do
    a > b
  end

  defp addCounter(item, acc) do
    {accItem, accCounter} = acc
    currentItemIsGreater = isGreater(item, accItem)

    if currentItemIsGreater do
      {item, accCounter + 1}
    else
      {item, accCounter}
    end
  end

  def solution do
    {_, output} =
      AOCUtils.readInputFile(@path)
      |> Enum.reduce({nil, 0}, fn item, acc -> addCounter(item, acc) end)

    output
  end
end
