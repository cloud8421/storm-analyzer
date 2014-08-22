defmodule WeatherDatapointsQueries do
  import Ecto.Query

  def all do
    query = from w in WeatherDatapoint,
            select: w
    Repo.all(query)
  end
end
