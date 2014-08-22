defmodule StormAnalyzer.Importer do

  def available do
    :rpc.call(remote_node, :storm_collector_storage, :all, [])
  end

  def import(collector_datapoint) do
    record = %WeatherDatapoint{
      uuid: collector_datapoint.uuid |> to_string,
      temperature: collector_datapoint.temp,
      brightness: collector_datapoint.bright,
      external_temperature: collector_datapoint.external_temperature,
      summary: collector_datapoint.summary,
      timestamp: collector_datapoint.timestamp |> Ecto.DateTime.from_erl
    }
    Repo.insert(record)
  end

  def import_all do
    Enum.map(available, &StormAnalyzer.Importer.import/1)
  end

  defp remote_node do
    System.get_env("COLLECTOR_NODE") |> String.to_atom
  end

end
