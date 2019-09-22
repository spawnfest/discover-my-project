defmodule SpawnfestWeb.HomeLive do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  use Phoenix.LiveView
  alias SpawnfestWeb.HomeView
  alias SpawnfestWeb.RepoLive
  alias SpawnfestWeb.Router.Helpers, as: Routes

  def render(assigns) do
    HomeView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    start_process.({params, socket})
  end

  def start_process do
    fn
      {%{"query" => url}, socket} ->
        {:noreply, live_redirect(socket, to: Routes.live_path(socket, RepoLive, url: url))}

      {%{}, socket} ->
        {:noreply, socket}
    end
  end
end
