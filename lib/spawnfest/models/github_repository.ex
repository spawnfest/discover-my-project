defmodule GitHubRepository do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [
    :fullname,
    :avatar_url,
    :description,
    :open_issues,
    :forks,
    :language,
    :default_branch
  ]
end
