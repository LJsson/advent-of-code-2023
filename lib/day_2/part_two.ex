
defmodule Day2.PartTwo do

  @cubes%{
    blue: 14,
    red: 12,
    green: 13,
  }

  def solution() do
    Inputs.get_input(2)
    |> format_input()
    |> List.flatten()
    |> Enum.sum

  end

  def format_input({:ok, input}) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x ->
      [game, content] = String.split(x, ":")
      String.split(game, " ")

      content
      |> String.split(~r/[;,]/)
      |> Enum.map(&String.trim/1)
      |> group_colors()
    end)
  end

  def group_colors(colors_list) do
    %{"red" => red_amount_list} = find_all(colors_list, "red")
    %{"blue" => blue_amount_list} = find_all(colors_list, "blue")
    %{"green" => green_amount_list} = find_all(colors_list, "green")

    Enum.max(red_amount_list) * Enum.max(blue_amount_list) * Enum.max(green_amount_list)
  end

  def find_all(list, color) do
    amount_list = Enum.filter(list, &String.contains?(&1, color))
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn pair ->
      [amount, _color] = String.split(pair, " ")
      amount |> String.to_integer()
    end)
    %{color => amount_list}
  end

  def start(_type, _args) do
    {:ok, self()}
  end
end
