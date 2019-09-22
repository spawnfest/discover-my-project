defmodule Spawnfest.Application do

  use Application

  def start(_type, _args) do
    children = [
			{AnalyzerManager, []}
    ]

    opts = [strategy: :one_for_one, name: Spawnfest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    SpawnfestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
