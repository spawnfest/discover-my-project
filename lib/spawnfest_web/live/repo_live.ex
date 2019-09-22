defmodule SpawnfestWeb.RepoLive do

	use Phoenix.LiveView
	alias SpawnfestWeb.RepoView
	alias SpawnfestWeb.Endpoint

	def render(assigns) do
		RepoView.render("index.html", assigns)
	end

	def mount(session, socket) do
		Endpoint.subscribe("repo_live_view")
		{:ok, socket}
	end

  def handle_info(%{event: "show_analysis", payload: payload}, socket) do

		IO.puts "aue onda!!***************"
		IO.inspect payload

    {:noreply, socket}
  end

  def handle_params(%{"url" => url}, _url, socket) do
		socket =
			socket
			|> assign(:url, validate_url(url))
		{:noreply, socket}
  end

  defp validate_url(url) do
    validation =
      fn
        false -> "error"
        _ -> url
      end
    url_validation = String.contains?(url, "github")
                       &&  String.contains?(url, "https")
                       &&  String.contains?(url, ".git")
    validation.(url_validation)
  end
end
