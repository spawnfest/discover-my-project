defmodule GitHubApiEngine do
  @api"https://api.github.com/repos/"

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

end

defmodule GitHubUtil do
  def get_repo_and_org(url) do
    url_words = String.split(url, "/")
    [repo|[org|_url_words]] = Enum.reverse(url_words)
    [repo, ""] = String.split(repo, ".git")
    {repo, org}
  end
end
