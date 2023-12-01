
defmodule PartOne do

  def solution() do
    #Inputs.get_input(1)
    inputs = "two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen"
    {:ok, inputs}
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
end
