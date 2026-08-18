defmodule DataProcessing.Transformer do
  @moduledoc """
  Transforms ingested data. Applies default transformations such as
  trimming strings, downcasing strings, and removing empty values.

  Can be extended with custom transformation rules.
  """

  @doc """
  Transforms a list of data records.

  ## Examples

      iex> DataProcessing.Transformer.transform([%{elixir_data_processing_name: " Alice ", elixir_data_processing_age: 30}])
      [%{elixir_data_processing_name: "alice", elixir_data_processing_age: 30}]

  """
  @spec transform(list(map())) :: list(map())
  def transform(data) when is_list(data) do
    Enum.map(data, &transform_record/1)
  end

  def transform(_) do
    []
  end

  @spec transform_record(map()) :: map()
  defp transform_record(record) do
    Enum.reduce(record, %{}, fn {key, value}, acc ->
      new_value = apply_transformations(value)
      Map.put(acc, key, new_value)
    end)
  end

  @spec apply_transformations(any()) :: any()
  defp apply_transformations(value) when is_binary(value) do
    value
    |> String.trim()
    |> String.downcase()
    |> maybe_empty_to_nil()
  end

  defp apply_transformations(value) when is_integer(value), do: value
  defp apply_transformations(value) when is_float(value), do: value
  defp apply_transformations(nil), do: nil
  defp apply_transformations(value), do: value

  @spec maybe_empty_to_nil(String.t()) :: String.t() | nil
  defp maybe_empty_to_nil(""), do: nil
  defp maybe_empty_to_nil(val), do: val
end
