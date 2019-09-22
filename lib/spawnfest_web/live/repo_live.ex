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
			|> assign(:url, url)
		{:noreply, socket}
  end

end
