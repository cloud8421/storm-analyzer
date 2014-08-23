defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  def conf(env), do: parse_url url(env)

  defp url(:dev),  do: System.get_env("DATABASE_URL") <> "_dev"
  defp url(:test), do: System.get_env("DATABASE_URL") <> "_test"
  defp url(:prod), do: System.get_env("DATABASE_URL")

  def priv do
    app_dir(:storm_analyzer, "priv/repo")
  end
end
