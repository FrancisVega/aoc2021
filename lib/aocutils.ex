defmodule AOCUtils do
  def readInputFile(inputFile) do
    {:ok, contents} = File.read(inputFile)

    contents
    |> String.split("\n", trim: true)
  end
end
