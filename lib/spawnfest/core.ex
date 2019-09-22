defmodule DiscoverMyProject do
  def start_analyze(url_repo) do
    IO.puts("1. Starting...")
    repo_dir = GitEngine.clone_repo(url_repo)
    IO.puts("2. Repo cloned...")
    branches = GitEngine.get_all_branches(repo_dir)
    IO.puts("3. Branches done")
    branch = BranchEngine.analize_branch(repo_dir)
    IO.puts("4. Getting github information")
    [github_repo, issues, pr, contributors] = GitHubData.get_data_from_github(url_repo)
    IO.puts("5. DONE!!!")
    {url_repo, branches, branch, github_repo, issues, pr, contributors}
  end

  def start_analyze_cloned_repo(repo_dir) do
    branches = GitEngine.get_all_branches(repo_dir)
    branch = BranchEngine.analize_branch(repo_dir)
    {branches, branch}
  end
end
