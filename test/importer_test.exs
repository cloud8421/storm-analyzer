defmodule ImporterTest do
  use ExUnit.Case

  alias StormAnalyzer.Importer

  setup do
    Repo.delete_all(WeatherDatapoint)
    :ok
  end

  test "it imports a datapoint" do
    collector_datapoint = %{bright: 865, external_temperature: 19.57,
      summary: "Partly Cloudy", temp: 25.2,
      timestamp: {{2014, 8, 22}, {14, 23, 11}},
      uuid: 'd8939dfc-2a07-11e4-8067-b8e8563a72e8'}
    Importer.import(collector_datapoint)
    assert(WeatherDatapoint |> Repo.all |> Enum.count == 1)
  end
end
