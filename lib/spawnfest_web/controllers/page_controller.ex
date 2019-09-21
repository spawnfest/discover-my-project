defmodule SpawnfestWeb.PageController do
  use SpawnfestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
