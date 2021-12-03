defmodule AOCUtils do
  def readInputFile(inputFile) do
    {:ok, contents} = File.read(inputFile)

    contents
    |> String.split("\n", trim: true)
  end

  def readInputFileAsIntegers(inputFile) do
    readInputFile(inputFile)
    |> Enum.map(&String.to_integer/1)
  end
end
