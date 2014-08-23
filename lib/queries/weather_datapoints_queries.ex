defmodule WeatherDatapointsQueries do
  import Ecto.Query
  alias Ecto.Adapters.Postgres

  def all do
    query = from w in WeatherDatapoint,
            select: w
    Repo.all(query)
  end

  def delta do
    query = """
      SELECT uuid, temperature, coalesce(previous_temperature, 0) as previous_temperature, coalesce(temperature - previous_temperature, 0) as delta, timestamp
      FROM
        (
          SELECT uuid, temperature, timestamp, lag(temperature, 1) OVER (order by timestamp) as previous_temperature
          FROM weather_datapoints
        ) AS weather_with_variation
      ;
    """
    Postgres.query(Repo, query, [])
  end

end
