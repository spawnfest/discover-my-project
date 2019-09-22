defmodule DiscoverMyProject do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  def start_analyze(url_repo) do
    request_for_execute_in_tasks = [
      {DiscoverMyProject.clone_and_get_data_from_repo(), url_repo},
      {DiscoverMyProject.get_data_from_github_api(), url_repo}
    ]

    res =
      request_for_execute_in_tasks
      |> Enum.map(fn {builder, args} -> apply_execution(builder, args) end)
      |> Enum.map(fn builder -> Task.async(builder) end)
      |> Enum.map(fn task -> Task.await(task, 9000) end)

    [
      {url_repo, branches, branch},
      [github_repo, issues, pr, contributors, issues_words, pr_words]
    ] = res

    {url_repo, branches, branch, github_repo, issues, pr, contributors, issues_words, pr_words}
  end

  defp apply_execution(fun, args), do: fn -> fun.(args) end

  def get_data_from_github_api do
    fn url_repo ->
      GitHubData.get_data_from_github(url_repo)
    end
  end

  def clone_and_get_data_from_repo do
    fn url_repo ->
      repo_dir = GitEngine.clone_repo(url_repo)
      branches = GitEngine.get_all_branches(repo_dir)
      branch = BranchEngine.analize_branch(repo_dir)
      {url_repo, branches, branch}
    end
  end
end
