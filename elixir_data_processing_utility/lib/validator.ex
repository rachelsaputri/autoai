defmodule DataProcessing.Validator do
  @moduledoc """
  Validates data records against a defined schema.
  Ensures that required fields are present and that their types match expectations.
  """

  @doc """
  Validates a list of records.

  ## Examples

      iex> schema = %{elixir_data_processing_id: [:integer, :optional], elixir_data_processing_name: [:string, :required], elixir_data_processing_email: [:string, :optional]}
      iex> data = [%{elixir_data_processing_name: "Alice", elixir_data_processing_email: "alice@example.com"}]
      iex> DataProcessing.Validator.validate(data, schema)
      {:ok, [%{elixir_data_processing_name: "alice", elixir_data_processing_email: "alice@example.com"}], []}

      iex> schema = %{elixir_data_processing_id: [:integer, :optional], elixir_data_processing_name: [:string, :required], elixir_data_processing_email: [:string, :optional]}
      iex> data = [%{elixir_data_processing_name: 123}]
      iex> DataProcessing.Validator.validate(data, schema)
      {:error, [%{elixir_data_processing_record: %{elixir_data_processing_name: 123}, elixir_data_processing_errors: ["elixir_data_processing_name must be a string"]}], []}

  """
  @spec validate(list(map()), map()) :: {:ok, list(map()), list(map())} | {:error, list(map()), list(map())}
  def validate(data, schema) when is_list(data) and is_map(schema) do
    {valid_records, invalid_records} = Enum.reduce(data, {[], []}, fn record, {valid, invalid} ->
      case validate_record(record, schema) do
        :ok ->
          {[record | valid], invalid}

        {:error, errors} ->
          {valid, [%{record: record, errors: errors} | invalid]}
      end
    end)

    # Reverse lists to preserve original order
    valid_records = Enum.reverse(valid_records)
    invalid_records = Enum.reverse(invalid_records)

    if Enum.empty?(invalid_records) do
      {:ok, valid_records}
    else
      {:error, invalid_records, valid_records}
    end
  end

  def validate(_, _), do: {:error, []}

  @spec validate_record(map(), map()) :: :ok | {:error, list(String.t())}
  defp validate_record(record, schema) do
    errors = Enum.reduce(schema, [], fn {field, constraints}, acc ->
      case check_field(record, field, constraints) do
        :ok ->
          acc

        {:error, error_msg} ->
          [error_msg | acc]
      end
    end)

    case errors do
      [] ->
        :ok

      errs ->
        {:error, Enum.reverse(errs)}
    end
  end

  @spec check_field(map(), atom(), list()) :: :ok | {:error, String.t()}
  defp check_field(record, field, [:string, :required]) do
    case Map.get(record, field) do
      nil ->
        {:error, "#{field} is required"}

      val when is_binary(val) ->
        :ok

      _ ->
        {:error, "#{field} must be a string"}
    end
  end

  defp check_field(record, field, [:integer, :required]) do
    case Map.get(record, field) do
      nil ->
        {:error, "#{field} is required"}

      val when is_integer(val) ->
        :ok

      _ ->
        {:error, "#{field} must be an integer"}
    end
  end

  defp check_field(record, field, [:float, :required]) do
    case Map.get(record, field) do
      nil ->
        {:error, "#{field} is required"}

      val when is_float(val) ->
        :ok

      _ ->
        {:error, "#{field} must be a float"}
    end
  end

  defp check_field(record, field, [:string, :optional]) do
    case Map.get(record, field) do
      nil ->
        :ok

      val when is_binary(val) ->
        :ok

      _ ->
        {:error, "#{field} must be a string"}
    end
  end

  defp check_field(record, field, [:integer, :optional]) do
    case Map.get(record, field) do
      nil ->
        :ok

      val when is_integer(val) ->
        :ok

      _ ->
        {:error, "#{field} must be an integer"}
    end
  end

  defp check_field(record, field, [:float, :optional]) do
    case Map.get(record, field) do
      nil ->
        :ok

      val when is_float(val) ->
        :ok

      _ ->
        {:error, "#{field} must be a float"}
    end
  end

  # Default case for unhandled constraints
  defp check_field(_, field, constraints) do
    {:error, "Unknown constraint for #{field}: #{inspect(constraints)}"}
  end
end
