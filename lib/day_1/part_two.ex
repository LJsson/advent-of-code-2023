
defmodule PartTwo do

  @letter_numbers%{
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9",
  }

  def solution() do
    Inputs.get_input(1)
    |> format_input()
    |> Enum.map(&pair_in_ints/1)
    |> Enum.sum()
  end

  def pair_in_ints(input_line) do
    regex = ~r/[1-9]|one|two|three|four|five|six|seven|eight|nine/
    matches = Regex.scan(regex, input_line)
    |> List.flatten()

    [first, last] = [hd(matches), List.last(matches)]
    |> Enum.map(fn match ->
      if String.length(match) > 1 do
        @letter_numbers[match]
      else
        match
      end
    end)
    String.to_integer(first <> last)

  end

  def format_input({:ok, input}) do
    input
    |> String.trim()
    |> String.split("\n")
  end
end
