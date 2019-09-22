defmodule GitHubApiEngine do
  @api"https://api.github.com/repos/"
  @github_headers [{"Accept", "application/vnd.github.mercy-preview+json"}]

  def get_repo_info({repo, org}) do
    repo_info = NetworkConsumer.get("#{@api}#{org}/#{repo}")
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

  def get_repo_issues({repo, org}) do
    repo_info = NetworkConsumer.get("#{@api}#{org}/#{repo}/issues?state=all", @github_headers)
    get_issues(repo_info)
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
end

defmodule GitHubUtil do
  def get_repo_and_org(url) do
    url_words = String.split(url, "/")
    [repo|[org|_url_words]] = Enum.reverse(url_words)
    [repo, ""] = String.split(repo, ".git")
    {repo, org}
  end
end
