require AOCUtils

defmodule Day02 do
  @path './files/input02-example.txt'

  defp is_forward(command), do: "forward" in command
  defp is_down(command), do: "down" in command
  defp is_up(command), do: "up" in command

  defp values_from_command(list, is_command) do
    list
    |> Enum.filter(is_command)
    |> Enum.map(&Enum.at(&1, 1))
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def solution1 do
    input =
      AOCUtils.readInputFile(@path)
      |> Enum.map(&String.split/1)

    forward = values_from_command(input, &is_forward/1)
    down = values_from_command(input, &is_down/1)
    up = values_from_command(input, &is_up/1)

    forward * (down - up)
  end
end
