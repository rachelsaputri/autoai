defmodule ElixirDataProcessingUtility.Validator do
  @moduledoc """
  Handles data validation against schemas.
  """

  @doc """
  Validates a list of records against a schema.
  Schema is a map where keys are field names and values are atoms representing the required type.
  Types supported: :integer, :float, :string, :map, :list.
  Returns a tuple {:ok, valid_records} or {:error, errors}.
  """
  def validate_schema(records, schema) when is_list(records) do
    errors =
      records
      |> Enum.with_index()
      |> Enum.flat_map(fn {record, index} ->
        Enum.filter(schema, fn {field, type} ->
          Map.has_key?(record, field)
        end)
        |> Enum.filter(fn {field, type} ->
          value = Map.get(record, field)
          case validate_type(value, type) do
            false -> true
            _ -> false
          end
        end)
        |> Enum.map(fn {field, type} ->
          "Record at index #{index} has invalid value for '#{field}'. Expected #{type}, got #{inspect(Map.get(record, field))}"
        end)
      end)

    valid_records =
      records
      |> Enum.with_index()
      |> Enum.filter(fn {record, _index} ->
        Enum.all?(schema, fn {field, type} ->
          case Map.fetch(record, field) do
            {:ok, value} -> validate_type(value, type)
            :error -> true
          end
        end)
      end)
      |> Enum.map(fn {record, _index} -> record end)

    if Enum.empty?(errors) do
      {:ok, valid_records}
    else
      {:error, errors}
    end
  end

  defp validate_type(value, :integer) do
    is_integer(value)
  end

  defp validate_type(value, :float) do
    is_float(value)
  end

  defp validate_type(value, :string) do
    is_binary(value)
  end

  defp validate_type(value, :map) do
    is_map(value)
  end

  defp validate_type(value, :list) do
    is_list(value)
  end
end
