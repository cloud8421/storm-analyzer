defmodule StormAnalyzer.Repo.Migrations.CreateWeatherDatapoints do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE IF NOT EXISTS weather_datapoints(
      uuid uuid primary key,
      temperature real,
      brightness integer,
      external_temperature real,
      summary text,
      timestamp time
    );
    """
  end

  def down do
    """
    DROP TABLE weather_datapoints;
    """
  end
end
