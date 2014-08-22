defmodule StormAnalyzer.Repo.Migrations.CreateWeatherDatapoints do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE IF NOT EXISTS weather_datapoints(
      uuid uuid primary key,
      temperature numeric(1),
      brightness integer,
      external_temperature numeric(1),
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
