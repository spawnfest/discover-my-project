defmodule SpawnfestWeb.HomeLive do

	use Phoenix.LiveView
	alias SpawnfestWeb.HomeView

	def render(assigns) do
		HomeView.render("index.html", assigns)
	end

	def mount(_session, socket) do
		{:ok, socket}
	end

  def handle_params(params, _url, socket) do
    IO.puts "***************"
    IO.inspect params
    {:noreply, socket}
  end

end
