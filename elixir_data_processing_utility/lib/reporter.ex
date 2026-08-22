defmodule ElixirDataProcessingUtility.Reporter do
  @moduledoc """
  Handles generation of reports from processed data.
  """

  @doc """
  Generates a summary report from a list of records.
  Assumes records are maps with numeric fields.
  Returns a map with statistics for each numeric field.
  """
  def generate_summary(data) when is_list(data) do
    if Enum.empty?(data) do
      %{}
    else
      numeric_keys =
        Enum.flat_map(data, fn record ->
          Enum.filter(Map.keys(record), fn key ->
            is_number(Map.get(record, key))
          end)
        end)
        |> Enum.uniq()

      Enum.reduce(numeric_keys, %{}, fn key, acc ->
        values = Enum.map(data, &Map.get(&1, key, 0))
        count = Enum.count(values)
        sum = Enum.sum(values)
        avg = if count > 0, do: sum / count, else: 0

        Map.put(acc, key, %{
          count: count,
          sum: sum,
          average: avg
        })
      end)
    end
  end

  @doc """
  Writes a report to a file in JSON format.
  """
  def write_report(data, filepath) do
    case Jason.encode_to_iodata(data) do
      {:ok, json} ->
        File.write(filepath, json)
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Prints a report to the console.
  """
  def print_report(data) do
    IO.puts("\n=== Data Processing Report ===")
    IO.inspect(data, limit: :infinity, printable_limit: :infinity)
    IO.puts("==============================\n")
  end
end
