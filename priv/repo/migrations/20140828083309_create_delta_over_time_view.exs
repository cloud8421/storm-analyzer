defmodule Repo.Migrations.CreateDeltaOverTimeView do
  use Ecto.Migration

  def up do
    """
    CREATE OR REPLACE VIEW delta_over_time AS
      SELECT uuid,
        temperature,
        external_temperature,
        coalesce(previous_temperature, 0) as previous_temperature,
        coalesce(temperature - previous_temperature, 0) as temperature_delta,
        coalesce(previous_external_temperature, 0) as previous_external_temperature,
        coalesce(external_temperature - previous_external_temperature, 0) as external_temperature_delta,
        brightness,
        summary,
        timestamp
      FROM weather_datapoints_with_variation;
    """
  end

  def down do
    """
      DROP VIEW delta_over_time;
    """
  end
end
