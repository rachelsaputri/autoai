defmodule DataProcessingEngine do
  @moduledoc """
  Main orchestration module for the data processing utility.
  Coordinates ingestion, transformation, and validation of data.
  """

  alias DataProcessing.{Ingestor, Transformer, Validator, Reporter}

  @doc """
  Processes a list of raw data records.

  ## Parameters

    - data: A list of maps representing raw data records.
    - schema: A map defining the validation schema. Keys are atoms (or strings that will be normalized),
              values are lists indicating type and required/optional status.

  ## Examples

      iex> data = [%{"id" => 1, "name" => "Alice", "age" => 30}]
      iex> schema = %{elixir_data_processing_id: [:integer, :optional], elixir_data_processing_name: [:string, :required], elixir_data_processing_age: [:integer, :optional]}
      iex> DataProcessingEngine.process(data, schema)
      %{valid_records: [%{elixir_data_processing_name: "alice", elixir_data_processing_age: 30, elixir_data_processing_id: 1}], invalid_records: [], summary: %{...}}

  """
  @spec process(list(map()), map()) :: map()
  def process(data, schema \\ %{}) do
    # Step 1: Ingest
    with {:ok, ingested_data} <- Ingestor.ingest(data) do
      # Step 2: Transform
      transformed_data = Transformer.transform(ingested_data)

      # Step 3: Validate
      case Validator.validate(transformed_data, schema) do
        {:ok, valid_records} ->
          summary = Reporter.generate_report(valid_records, [])
          %{
            valid_records: valid_records,
            invalid_records: [],
            summary: summary
          }

        {:error, invalid_records, valid_records} ->
          summary = Reporter.generate_report(valid_records, invalid_records)
          %{
            valid_records: valid_records,
            invalid_records: invalid_records,
            summary: summary
          }
      end
    end
    else
      {:error, reason} ->
        summary = Reporter.generate_report([], [])
        %{
          valid_records: [],
          invalid_records: [],
          summary: summary,
          error: reason
        }
    end
  end
end
