defmodule DataProcessing.Reporter do
  @moduledoc """
  Generates reports on the processed data.
  Provides statistics on valid/invalid records and can export data to JSON.
  """

  alias DataProcessing.Validator

  @doc """
  Generates a summary report of the validation results.

  ## Examples

      iex> valid = [%{name: "Alice"}]
      iex> invalid = [%{record: %{name: 123}, errors: ["name must be a string"]}]
      iex> DataProcessing.Reporter.generate_report(valid, invalid)
      %{total_processed: 2, valid_count: 1, invalid_count: 1, success_rate: 50.0}

  """
  @spec generate_report(list(map()), list(map())) :: map()
  def generate_report(valid_records, invalid_records) do
    total = length(valid_records) + length(invalid_records)
    valid_count = length(valid_records)
    invalid_count = length(invalid_records)
    success_rate = if total > 0, do: (valid_count / total) * 100, else: 0.0

    %{
      total_processed: total,
      valid_count: valid_count,
      invalid_count: invalid_count,
      success_rate: success_rate
    }
  end

  @doc """
  Exports valid records to a JSON string.

  ## Examples

      iex> data = [%{name: "Alice", age: 30}]
      iex> DataProcessing.Reporter.export_to_json(data)
      "[{\"name\":\"Alice\",\"age\":30}]"

  """
  @spec export_to_json(list(map())) :: String.t()
  def export_to_json(records) when is_list(records) do
    records
    |> Enum.map(fn record ->
      Enum.reduce(record, %{}, fn {key, value}, acc ->
        string_key = to_string_key(key)
        Map.put(acc, string_key, value)
      end)
    end)
    |> Jason.encode!
  end

  def export_to_json(_), do: "[]"

  @spec to_string_key(atom()) :: String.t()
  defp to_string_key(key) when is_atom(key) do
    key
    |> Atom.to_string()
    |> String.replace_prefix("elixir_data_processing_", "")
  end

  defp to_string_key(key) when is_binary(key), do: key
end
