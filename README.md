#Storm Analyzer

Analysis application to use with the [Collector application](https://github.com/cloud8421/storm-collector) Requires a working collector application with the same cookie.

Please see <http://www.erlang.org/doc/getting_started/conc_prog.html> for more details.

## Setup

The application requires [Elixir](http://elixir-lang.org/) and Postgresql.

    $ mix deps.get
    $ createdb -u YOUR_USER storm_analyzer
    $ mix ecto.migrate Repo
    $ COLLECTOR_NODE=name@host POSTGRES_URL="ecto://user:password@host/storm_analyzer" make start

## Available iex commands

    iex> StormAnalyzer.Importer.import_all

Loads data from collector into Postgres.

    iex> WeatherDatapointsQueries.delta

Shows variation of internal temperature over time.
