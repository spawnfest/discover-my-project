defmodule GitHubApiEngine do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  @api "https://api.github.com/repos/"
  @github_headers [{"Accept", "application/vnd.github.mercy-preview+json"}]

  def get_repo_info do
    fn {repo, org} ->
      repo_info = NetworkConsumer.get("#{@api}#{org}/#{repo}", @github_headers)

      %GitHubRepository{
        fullname: repo_info["full_name"],
        avatar_url: repo_info["owner"]["avatar_url"],
        description: repo_info["description"],
        open_issues: repo_info["open_issues"],
        forks: repo_info["forks"],
        language: repo_info["language"],
        default_branch: repo_info["default_branch"]
      }
    end
  end

  def get_repo_issues do
    fn {repo, org} ->
      repo_info = NetworkConsumer.get("#{@api}#{org}/#{repo}/issues?state=all", @github_headers)
      get_issues(repo_info)
    end
  end

  defp get_issues(repo_info) do
    for issue <- repo_info do
      %GitHubIssue{
        url: issue["html_url"],
        title: issue["title"],
        state: issue["state"],
        date_created: issue["created_at"]
      }
    end
  end

  def get_repo_pull_requests do
    fn {repo, org} ->
      repo_info = NetworkConsumer.get("#{@api}#{org}/#{repo}/pulls?state=all", @github_headers)
      get_pull_requests(repo_info)
    end
  end

  defp get_pull_requests(pulls) do
    for pull <- pulls do
      %GitHubPR{
        number: pull["number"],
        title: pull["title"],
        state: pull["state"],
        url: pull["html_url"],
        author: pull["author_association"]
      }
    end
  end

  def get_repo_contributors do
    fn {repo, org} ->
      repo_info = NetworkConsumer.get("#{@api}#{org}/#{repo}/contributors", @github_headers)
      get_contributors(repo_info)
    end
  end

  def get_contributors(repo_info) do
    for contributor <- repo_info do
      %GitHubContributor{
        avatar_url: contributor["avatar_url"],
        username: contributor["login"],
        contributions: contributor["contributions"]
      }
    end
  end
end

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
end

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
