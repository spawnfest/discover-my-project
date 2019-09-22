defmodule AnalyzerManager do
  use GenServer

  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def init(_) do
    {:ok, %{}}
  end

  def handle_call(:get, _from, state) do
    {:reply, [], state}
  end
end
