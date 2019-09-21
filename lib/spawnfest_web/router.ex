defmodule SpawnfestWeb.Router do
  use SpawnfestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
    plug :put_layout, {SpawnfestWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpawnfestWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/home", HomeLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", SpawnfestWeb do
  #   pipe_through :api
  # end
end
