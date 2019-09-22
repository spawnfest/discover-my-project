defmodule GitHubUtil do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  def get_repo_and_org(url) do
    url_words = String.split(url, "/")
    [repo | [org | _url_words]] = Enum.reverse(url_words)
    [repo, ""] = String.split(repo, ".git")
    {repo, org}
  end
end
