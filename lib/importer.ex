defmodule StormAnalyzer.Importer do

  def available do
    :rpc.call(remote_node, :storm_collector_storage, :all, [])
  end

  defp remote_node do
    System.get_env("COLLECTOR_NODE") |> String.to_atom
  end

end
