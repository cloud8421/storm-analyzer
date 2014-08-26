defmodule DifferenceInsideOutside do
  defstruct uuid: nil,
    temperature: nil,
    external_temperature: nil,
    difference: nil,
    timestamp: nil

  def from_query_result(query_result) do
    columns = query_result.columns
    Enum.map(query_result.rows, fn(row) ->
      Enum.zip(columns, row |> Tuple.to_list)
      |> Enum.reduce(%DifferenceInsideOutside{}, fn({col_name, value}, acc) ->
        casted_value = cast(col_name, value)
        Map.put(acc, col_name |> String.to_atom, casted_value)
      end)
    end)
  end

  defp cast(col_name, value) when col_name in ["difference", "temperature", "external_temperature"] do
    Float.round(value, 2)
  end
  defp cast(_, value), do: value
end
