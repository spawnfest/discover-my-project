defmodule AnalyzerManager do
  use GenServer
  alias SpawnfestWeb.Endpoint

  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get_analysis(url) do
    GenServer.cast(__MODULE__, {:get_analysis, url})
  end

  def init(_) do
    {:ok, %{}}
  end

  def handle_cast({:get_analysis, url}, state) do
    analysis = DiscoverMyProject.start_analyze(url)
    Endpoint.broadcast("repo_live_view", "show_analysis", %{repo: analysis})
    {:noreply, state}
  end
end
