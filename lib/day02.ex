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

  defp values_from_command(list, command) do
    list
    |> Enum.filter(command)
    |> Enum.map(&value/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def solution1 do
    input =
      AOCUtils.readInputFile(@path)
      |> Enum.map(&String.split/1)

    forward = values_from_command(input, &forward/1)
    down = values_from_command(input, &down/1)
    up = values_from_command(input, &up/1)

    forward * (down - up)
  end
end
