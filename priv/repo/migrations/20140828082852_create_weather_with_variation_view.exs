defmodule Repo.Migrations.CreateWeatherWithVariationView do
  use Ecto.Migration

  def up do
    """
    CREATE OR REPLACE VIEW weather_datapoints_with_variation AS
      SELECT weather_datapoints.*,
        lag(temperature, 1) OVER (order by timestamp) as previous_temperature,
        lag(external_temperature, 1) OVER (order by timestamp) as previous_external_temperature
      FROM weather_datapoints;
    """
  end

  def down do
    """
      DROP VIEW weather_datapoints_with_variation;
    """
  end
end
