defmodule StormAnalyzer.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def priv do
    app_dir(:storm_analyzer, "priv/repo")
  end

  def conf do
    parse_url System.get_env("POSTGRES_URL")
  end
end
