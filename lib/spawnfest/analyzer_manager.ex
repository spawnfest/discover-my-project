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
    IO.puts "Starting..."
    analysis = DiscoverMyProject.start_analyze(url)
    IO.puts "Finsihs..."
    Endpoint.broadcast("repo_live_view", "show_analysus", %{repo: [1,2,3]})
    {:noreply, state}
  end
end
