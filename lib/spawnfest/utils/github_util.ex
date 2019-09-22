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

  def set_default_response do
    fn
      nil -> "No provided."
      desc -> desc
    end
  end

  def get_most_used_words(structs) do
    titles = for struct <- structs, do: struct.title
    words = for title <- titles, do: String.split(title, " ")
    words = List.flatten(words)
    Utils.get_words_counters(words)
  end
end
