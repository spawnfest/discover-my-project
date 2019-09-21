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
end
