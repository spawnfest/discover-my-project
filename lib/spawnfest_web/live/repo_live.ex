defmodule SpawnfestWeb.RepoLive do

	use Phoenix.LiveView
	alias SpawnfestWeb.RepoView

	def render(assigns) do
		RepoView.render("index.html", assigns)
	end

	def mount(_session, socket) do
		{:ok, socket}
	end
end
