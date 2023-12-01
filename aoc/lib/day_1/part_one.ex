
defmodule PartOne do

  def solution() do
    Inputs.get_input(1)
    |> format_input()
    |> Enum.map(fn input ->
      input
      |> String.replace(~r/[^\d]/, "")
      |> String.codepoints()
    end)
    |> Enum.map(&pair_in_ints/1)
    |> Enum.sum()
  end

  def pair_in_ints(list) do
    case List.last(list) do
      [] ->
        String.to_integer(hd(list) <> hd(list))

      last ->
        String.to_integer(hd(list) <> last)
    end
  end

  def format_input({:ok, input}) do
    input
    |> String.trim()
    |> String.split("\n")
  end

  def start(_type, _args) do
    {:ok, self()}
  end
end
