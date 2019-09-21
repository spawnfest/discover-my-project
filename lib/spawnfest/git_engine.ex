defmodule GitEngine do

  def clone_repo(repo) do
    tmp_dir = "#{System.tmp_dir()}/repo"
    {"", 0} = System.cmd("git", ["clone", repo, tmp_dir])
    tmp_dir
  end

	def get_all_branches(repo_dir) do
    {body, 0} = System.cmd("git", ["branch", "--all"], cd: repo_dir)
		Utils.get_branches_names(body)
	end
end
