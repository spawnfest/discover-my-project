defmodule SpawnfestWeb.HomeLive do

	use Phoenix.LiveView
	alias SpawnfestWeb.HomeView
	alias SpawnfestWeb.Router.Helpers, as: Routes
	alias SpawnfestWeb.RepoLive

	def render(assigns) do
		HomeView.render("index.html", assigns)
	end

	def mount(_session, socket) do
		{:ok, socket}
	end

  def handle_params(params, _url, socket) do
		start_process.({params, socket})
  end

	def start_process() do
		fn
			{%{"query" => url}, socket} ->
				{:noreply, live_redirect(socket, to: Routes.live_path(socket, RepoLive, url: url))}
			{%{}, socket} ->
				{:noreply, socket}
		end
	end

end
