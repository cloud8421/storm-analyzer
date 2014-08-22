defmodule WeatherDatapoint do
  use Ecto.Model

  schema "weather_datapoints", primary_key: {:uuid, :string, []} do
    field :temperature, :float
    field :brightness, :integer
    field :external_temperature, :float
    field :summary, :string
    field :timestamp, :datetime
  end
end
