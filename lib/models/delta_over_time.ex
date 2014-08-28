defmodule DeltaOverTime do
  use Ecto.Model

  schema "delta_over_time", primary_key: {:uuid, :string, []} do
    field :temperature, :float
    field :external_temperature, :float
    field :previous_temperature, :float
    field :temperature_delta, :float
    field :previous_external_temperature, :float
    field :external_temperature_delta, :float
    field :brightness, :integer
    field :summary, :string
    field :timestamp, :datetime
  end
end
