defmodule SpawnfestWeb.HomeLive do

	use Phoenix.LiveView
	alias SpawnfestWeb.HomeView

	def render(assigns) do
		HomeView.render("index.html", assigns)
	end

	def mount(_session, socket) do
		{:ok, socket}
	end

	def handle_event("add", params, socket) do
		{:noreply, socket}
	end

end
