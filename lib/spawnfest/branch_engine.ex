defmodule BranchEngine do
  def get_commits_in_branch(repo_dir) do
    repo_dir
      |> get_commit_history_string()
      |> Utils.get_commits()
  end

  def get_commit_history_string(repo_dir) do
    {body, 0} = System.cmd("git", ["log", "--all", "--pretty=format:'%h<->%cn<->%s%Creset'"], cd: repo_dir)
    body
  end
end

