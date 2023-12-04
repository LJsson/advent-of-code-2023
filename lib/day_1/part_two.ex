
defmodule Day1.PartTwo do

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
    input_line = split_number_combinations(input_line)

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
    |> IO.inspect()

  end

  def split_number_combinations(input_line) do
    replacements = [
      {"oneight", "oneeight"},
      {"nineight", "nineeight"},
      {"threeight", "threeeight"},
      {"fiveight", "fiveeight"},
      {"sevenine", "sevennine"},
      {"eightwo", "eighttwo"},
      {"eighthree", "eightthree"},
      {"twone", "twoone"}
    ]

    Enum.reduce(replacements, input_line, fn {pattern, replacement}, acc ->
      if String.contains?(acc, pattern) do
        String.replace(acc, pattern, replacement)
      else
        acc
      end
    end)
  end

  def format_input({:ok, input}) do
    input
    |> String.trim()
    |> String.split("\n")
  end
end
