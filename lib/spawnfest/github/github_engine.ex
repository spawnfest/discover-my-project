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
        fullname: GitHubUtil.set_default_response.(repo_info["full_name"]),
        avatar_url: GitHubUtil.set_default_response.(repo_info["owner"]["avatar_url"]),
        description: GitHubUtil.set_default_response.(repo_info["description"]),
        open_issues: GitHubUtil.set_default_response.(repo_info["open_issues"]),
        forks: GitHubUtil.set_default_response.(repo_info["forks"]),
        language: GitHubUtil.set_default_response.(repo_info["language"]),
        default_branch: GitHubUtil.set_default_response.(repo_info["default_branch"])
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
        url: GitHubUtil.set_default_response.(issue["html_url"]),
        title: GitHubUtil.set_default_response.(issue["title"]),
        state: GitHubUtil.set_default_response.(issue["state"]),
        date_created: GitHubUtil.set_default_response.(issue["created_at"])
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
        number: GitHubUtil.set_default_response.(pull["number"]),
        title: GitHubUtil.set_default_response.(pull["title"]),
        state: GitHubUtil.set_default_response.(pull["state"]),
        url: GitHubUtil.set_default_response.(pull["html_url"]),
        author: GitHubUtil.set_default_response.(pull["author_association"])
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
        avatar_url: GitHubUtil.set_default_response.(contributor["avatar_url"]),
        username: GitHubUtil.set_default_response.(contributor["login"]),
        contributions: GitHubUtil.set_default_response.(contributor["contributions"])
      }
    end
  end
end
