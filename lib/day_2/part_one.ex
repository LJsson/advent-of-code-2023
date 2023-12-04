
defmodule Day2.PartOne do

  @cubes%{
    blue: 14,
    red: 12,
    green: 13,
  }

  def solution() do
    Inputs.get_input(2)
    |> format_input()
    |> Enum.map(&find_doable_games/1)
    |> List.flatten()
    |> Enum.sum

  end

  def format_input({:ok, input}) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x ->
      [game, content] = String.split(x, ":")
      [_game, index] = String.split(game, " ")
      index = index |> String.to_integer()

      color_sets = content
      |> String.split(";")
      |> Enum.map(&String.split(&1, ","))
      color_map = Enum.map(color_sets, &caluculate_color_numbers/1)
      |> IO.inspect()

      {index, color_map}
    end)
  end

  def caluculate_color_numbers(color_sets) do
      Enum.map(color_sets, fn set ->
        [amount, color] =
          String.trim(set)
          |> String.split(" ")
        %{color => amount |> String.to_integer()}
      end)
      |> Enum.reduce(%{}, fn map, acc ->
        Map.merge(acc, map)
      end)
  end

  def find_doable_games({index, game_maps}) do
    results = Enum.map(game_maps, fn game_map  ->
      with true <- Map.get(game_map, "red") <= @cubes[:red] || Map.get(game_map, "red") == nil,
      true <- Map.get(game_map, "blue") <= @cubes[:blue] || Map.get(game_map, "blue") == nil,
      true <- Map.get(game_map, "green") <= @cubes[:green] || Map.get(game_map, "green") == nil do
        true
      else
        false ->
          false
      end
    end)
    if Enum.all?(results, fn t -> t end) do
      index
    else
      0
    end
  end

  def start(_type, _args) do
    {:ok, self()}
  end
end
