defmodule GitEngine do

  def clone_repo(repo) do
    tmp_dir = "#{System.tmp_dir()}/repo"
    {"", 0} = System.cmd("git", ["clone", repo, tmp_dir])
    tmp_dir
  end
end
