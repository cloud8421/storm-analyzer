defmodule DeltaOverTime do
  defstruct uuid: nil,
    temperature: nil,
    previous_temperature: nil,
    delta: nil,
    timestamp: nil


  def from_query_result(query_result) do
    columns = query_result.columns
    Enum.map(query_result.rows, fn(row) ->
      Enum.zip(columns, row |> Tupl.to_list)
      |> Enum.reduce(%DeltaOverTime{}, fn({col_name, value}, acc) ->
        Map.put(acc, col_name |> String.to_atom, value)
      end)
    end)
  end
end
