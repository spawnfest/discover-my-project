defmodule GitHubData do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  def get_data_from_github(url) do
    repo_and_org = GitHubUtil.get_repo_and_org(url)

    api_request = [
      {GitHubApiEngine.get_repo_info(), repo_and_org},
      {GitHubApiEngine.get_repo_issues(), repo_and_org},
      {GitHubApiEngine.get_repo_pull_requests(), repo_and_org},
      {GitHubApiEngine.get_repo_contributors(), repo_and_org}
    ]

    res =
      api_request
      |> Enum.map(fn {builder, args} -> apply_execution(builder, args) end)
      |> Enum.map(fn builder -> Task.async(builder) end)
      |> Enum.map(fn task -> Task.await(task, 9000) end)
  end

  defp apply_execution(fun, args), do: fn -> fun.(args) end
end
