defmodule SpawnfestWeb.RepoLive do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  use Phoenix.LiveView
  alias SpawnfestWeb.Endpoint
  alias SpawnfestWeb.RepoView

  def render(assigns) do
    RepoView.render("index.html", assigns)
  end

  def mount(session, socket) do
    Endpoint.subscribe("repo_live_view")
    {:ok, socket}
  end

  def handle_info(
        %{
          event: "show_analysis",
          payload: %{repo: {url_repo, branches, branch, github_repo, issues, prs, contributors}}
        },
        socket
      ) do
    socket =
      socket
      |> assign(:url, url_repo)
      |> assign(:branches, branches)
      |> assign(:branch, branch)
      |> assign(:repo, github_repo)
      |> assign(:issues, issues)
      |> assign(:prs, prs)
      |> assign(:contributors, contributors)

    {:noreply, socket}
  end

  def handle_params(%{"url" => url}, _url, socket) do
    socket =
      socket
      |> assign(:url, validate_url(url))
      |> assign(:branches, [])

    {:noreply, socket}
  end

  def handle_params(%{}, _url, socket) do
    socket =
      socket
      |> assign(:url, "error")
      |> assign(:branches, [])

    {:noreply, socket}
  end

  defp validate_url(url) do
    validation = fn
      false ->
        "error"

      _ ->
        # Starting...
        _ = AnalyzerManager.get_analysis(url)
        url
    end

    url_validation =
      String.contains?(url, "github") &&
        String.contains?(url, "https") &&
        String.contains?(url, ".git")

    validation.(url_validation)
  end
end
