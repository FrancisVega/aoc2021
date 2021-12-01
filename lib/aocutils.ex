defmodule AOCUtils do
  def readInputFile(inputFile) do
    {:ok, contents} = File.read(inputFile)
    contents
  end
end
