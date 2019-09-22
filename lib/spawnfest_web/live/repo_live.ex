defmodule SpawnfestWeb.RepoLive do

	use Phoenix.LiveView
	alias SpawnfestWeb.RepoView

	def render(assigns) do
		RepoView.render("index.html", assigns)
	end

	def mount(session, socket) do
		{:ok, socket}
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
