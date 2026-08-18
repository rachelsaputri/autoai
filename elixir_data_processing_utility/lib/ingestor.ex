defmodule DataProcessing.Ingestor do
  @moduledoc """
  Handles the ingestion of raw data into the processing pipeline.
  Validates that the input is a list of maps and normalizes keys if necessary.
  """

  @doc """
  Ingests raw data.

  ## Examples

      iex> DataProcessing.Ingestor.ingest([%{"id" => 1, "name" => "Alice"}])
      {:ok, [%{id: 1, name: "Alice"}]}

      iex> DataProcessing.Ingestor.ingest("not a list")
      {:error, "Input must be a list of maps"}

  """
  def ingest(data) when is_list(data) do
    case Enum.all?(data, &is_map/1) do
      true ->
        {:ok, normalize_keys(data)}

      false ->
        {:error, "Input must be a list of maps"}
    end
  end

  def ingest(_), do: {:error, "Input must be a list of maps"}

  # Normalize keys from strings to atoms for easier processing in Elixir
  @spec normalize_keys(list(map())) :: list(map())
  defp normalize_keys(data) do
    Enum.map(data, fn record ->
      Enum.reduce(record, %{}, fn {key, value}, acc ->
        normalized_key = to_atom_key(key)
        Map.put(acc, normalized_key, value)
      end)
    end)
  end

  @spec to_atom_key(String.t() | atom()) :: atom()
  defp to_atom_key(key) when is_binary(key) do
    String.to_atom("elixir_data_processing_" <> key)
  end

  defp to_atom_key(key) when is_atom(key), do: key
end
