defmodule DeltaOverTimeTest do
  use ExUnit.Case

  test "returns a DeltaOverTime struct" do
    query_result = %Postgrex.Result{columns: ["uuid", "temperature", "previous_temperature",
      "delta", "timestamp"], command: :select, num_rows: 71,
     rows: [{"38918080-2a07-11e4-9c25-b8e8563a72e8", 23.399999618530273, 0.0, 0.0,
       %Ecto.Time{hour: 14, min: 18, sec: 43}}]}
    expected = [%DeltaOverTime{
        uuid: "38918080-2a07-11e4-9c25-b8e8563a72e8",
        temperature: 23.4,
        previous_temperature: 0.0,
        delta: 0.0,
        timestamp: %Ecto.Time{hour: 14, min: 18, sec: 43}
    }]
    assert(DeltaOverTime.from_query_result(query_result) == expected)
  end
end
