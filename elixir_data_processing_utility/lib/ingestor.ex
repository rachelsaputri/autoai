defmodule ElixirDataProcessingUtility.Ingestor do
  @moduledoc """
  Handles data ingestion from various sources.
  Currently supports file-based ingestion.
  """

  @doc """
  Ingests data from a CSV file.
  Assumes the first line is a header.
  Returns a list of maps where keys are header names.
  """
  def ingest_csv(filepath) do
    case File.read(filepath) do
      {:ok, content} ->
        lines = String.split(content, "\\n", trim: true)
        [headers | data_lines] = lines
        header_list = String.split(headers, ",")

        data_lines
        |> Enum.map(fn line ->
          values = String.split(line, ",")
          Enum.zip(header_list, values)
          |> Map.new()
        end)

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Ingests data from a JSON file.
  Returns the parsed JSON data.
  """
  def ingest_json(filepath) do
    case File.read(filepath) do
      {:ok, content} ->
        Jason.decode(content)
      {:error, reason} ->
        {:error, reason}
    end
  end
end
