defmodule DiscoverMyProject do

  def start_analyze(url_repo) do
    repo_dir = GitEngine.clone_repo(url_repo)
    branches = GitEngine.get_all_branches(repo_dir)
    branch = BranchEngine.analize_branch(repo_dir)
    {branches, branch}
  end

  def start_analyze_cloned_repo(repo_dir) do
    branches = GitEngine.get_all_branches(repo_dir)
    branch = BranchEngine.analize_branch(repo_dir)
    {branches, branch}
  end

end
