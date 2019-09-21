# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :spawnfest, SpawnfestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zViry+ay4f3js2ILJO842M+I/CrjJRYOJmlTs51m0yD7NcTRe4eJ4XfJloEQpU2X",
  render_errors: [view: SpawnfestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Spawnfest.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
