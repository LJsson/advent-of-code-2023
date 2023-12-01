defmodule Inputs do
  @base_url "https://adventofcode.com"
  @session_cookie "53616c7465645f5fe2d649be10a6dfc88d185a2f39431c73c095dd8d1311182c9a8ca161bd803622fde07e9848ba801f2dd03d3565f2531a01088f4bd34813c1"

  def get_input(day) do
    url = "#{@base_url}/2023/day/#{day}/input"
    headers = [{"cookie", "session=#{@session_cookie}"}]

    case HTTPoison.get(url, headers) do
      {:ok, %{status_code: 200, body: body}} ->
        IO.puts("Input for Day #{day}:")
        {:ok, body}

      {:ok, %{status_code: 404}} ->
        IO.puts("Input not found. Make sure you have access to the input for Day #{day}.")

      {:error, reason} ->
        IO.puts("Failed to fetch input. Reason: #{reason}")
        {:error, reason}
    end
  end
end
