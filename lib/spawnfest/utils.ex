defmodule Utils do
  def get_commits(commit_history) do
    commits = String.split(commit_history, "\'\n\'")
    for commit <- commits, do: get_commit(commit)
  end

  def get_commit(commit_string) do
    [hash, author, desc] = String.split(commit_string, "<->")
    words = String.split(desc, " ")
    %Commit{ hash: hash, description: desc, author: author, words: words}
  end

  def get_list_of_words_in_commits(commits) do
    words_in_commits = for commit <- commits, do: commit.words
    List.flatten(words_in_commits)
  end

  def get_words_counters( words ) do
    words
      |> Enum.uniq()
      |> get_counters(words)
      |> Enum.sort_by(fn {_word, counter} -> counter end)
  end

  defp get_counters( words_for_find, words ) do
    for w <- words_for_find do
      counter = Enum.count( words, fn(word) -> word == w end)
      {w, counter}
    end
  end

end
