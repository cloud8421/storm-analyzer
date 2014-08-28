defmodule WeatherDatapointsQueries do
  import Ecto.Query
  alias Ecto.Adapters.Postgres

  def all do
    query = from w in WeatherDatapoint,
            select: w
    Repo.all(query)
  end

  def delta do
    query = from w in DeltaOverTime,
            select: w
    Repo.all(query)
  end

  def difference_inside_outside do
    query = """
    SELECT uuid, temperature, external_temperature, (temperature - external_temperature) AS difference, timestamp
    FROM weather_datapoints
    ORDER BY timestamp;
    """
    Postgres.query(Repo, query, []) |> DifferenceInsideOutside.from_query_result
  end

end
