defmodule GitEngine do

  def clone_repo(repo) do
    tmp_dir = "#{System.tmp_dir()}/repo"
    {"", 0} = System.cmd("git", ["clone", repo, tmp_dir])
    tmp_dir
  end

end

defmodule BranchEngine do

  def analize_branch(repo_dir) do
    {body, 0} = System.cmd("git", ["log", "--all", "--pretty=format:'%h<->%cn<->%s%Creset'"], cd: repo_dir)
  end

end


defmodule Commit do
   defstruct [:hash, :description, :author, :words]
end

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
