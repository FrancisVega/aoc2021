require AOCUtils

defmodule Day02 do
  @path './files/input02-example.txt'

  defp instruction(inst, name) do
    [order, _] = inst
    order === name
  end

  def value(x) do
    [_, valor] = x
    valor
  end

  defp forward(x), do: instruction(x, "forward")
  defp down(x), do: instruction(x, "down")
  defp up(x), do: instruction(x, "up")

  defp calculate_values(x) do
    x
    |> Enum.map(&value/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def solution1 do
    instructions =
      AOCUtils.readInputFile(@path)
      |> Enum.map(fn x -> String.split(x) end)

    forward =
      instructions
      |> Enum.filter(&forward/1)
      |> calculate_values()

    down =
      instructions
      |> Enum.filter(&down/1)
      |> calculate_values()

    up =
      instructions
      |> Enum.filter(&up/1)
      |> calculate_values()

    forward * (down - up)
  end
end
