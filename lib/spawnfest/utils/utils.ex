defmodule Utils do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  def get_commits(commit_history) do
    commits = String.split(commit_history, "\'\n\'")
    for commit <- commits, do: get_commit(commit)
  end

  def get_commit(commit_string) do
    [hash, author, date, desc] = String.split(commit_string, "<->")
    words = String.split(desc, " ")
    date_created = UtilDate.parse_date(date)

    %Commit{
      hash: hash,
      description: desc,
      author: author,
      words: words,
      date_created: date_created
    }
  end

  def get_list_of_words_in_commits(commits) do
    words_in_commits = for commit <- commits, do: commit.words
    List.flatten(words_in_commits)
  end

  def get_words_counters(words) do
    words
    |> Enum.uniq()
    |> get_counters(words)
    |> Enum.sort_by(fn {_word, counter} -> counter end)
    |> Enum.reverse()
    |> get_most_recurrent_words()
  end

  def get_most_recurrent_words(counters) do
    size = length(counters)

    case size do
      size when size < 25 -> counters
      _ -> Enum.slice(counters, 0, 25)
    end
  end

  defp get_counters(words_for_find, words) do
    for w <- words_for_find do
      counter = Enum.count(words, fn word -> word == w end)
      {w, counter}
    end
  end

  def get_authors(commits) do
    authors = for commit <- commits, do: commit.author
    authors |> List.flatten() |> Enum.uniq()
  end

  def get_branches_names(branches_string) do
    [_master | [_head | branches]] = String.split(branches_string, "\n  ")
    [_origin_master | branches] = Enum.reverse(branches)

    for branch <- branches do
      ["remotes", "origin", branch_name] = String.split(branch, "/")
      branch_name
    end
  end
end
