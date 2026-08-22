defmodule ElixirDataProcessingUtility.Transformer do
  @moduledoc """
  Handles data transformation operations.
  Provides functions to map, filter, and convert data.
  """

  @doc """
  Maps each record in the data using the provided function.
  """
  def map_records(data, mapper_func) when is_list(data) do
    Enum.map(data, fn record ->
      mapper_func.(record)
    end)
  end

  def map_records(data, mapper_func) when is_map(data) do
    Map.new(data, fn {key, value} ->
      mapper_func.({key, value})
    end)
  end

  @doc """
  Filters records in the data based on a predicate function.
  """
  def filter_records(data, predicate) when is_list(data) do
    Enum.filter(data, predicate)
  end

  def filter_records(data, predicate) when is_map(data) do
    Map.filter(data, predicate)
  end

  @doc """
  Converts a list of maps to a map of lists, grouped by a key.
  Useful for pivot-style transformations.
  """
  def group_by(data, key) when is_list(data) do
    data
    |> Enum.group_by(fn record ->
      record[key]
    end)
  end

  @doc """
  Sanitizes a string by trimming whitespace and converting to lowercase.
  """
  def sanitize_string(string) do
    string
    |> String.trim()
    |> String.downcase()
  end
end
