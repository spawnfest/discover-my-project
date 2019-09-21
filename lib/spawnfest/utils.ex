defmodule Utils do
  def get_commits(commit_history) do
    commits = String.split(commit_history, "\'\n\'")
    for commit <- commits, do: get_commit(commit)
  end

  def get_commit(commit_string) do
    [hash, author, date, desc] = String.split(commit_string, "<->")
    words = String.split(desc, " ")
		date_created = UtilDate.parse_date(date)
    %Commit{
			hash: hash,
			description: desc,
      author: author,
      words: words,
      date_created: date_created}
  end

  def get_list_of_words_in_commits(commits) do
    words_in_commits = for commit <- commits, do: commit.words
    List.flatten(words_in_commits)
  end

  def get_words_counters(words) do
    words
      |> Enum.uniq()
      |> get_counters(words)
      |> Enum.sort_by(fn {_word, counter} -> counter end)
  end

  defp get_counters(words_for_find, words) do
    for w <- words_for_find do
      counter = Enum.count(words, fn(word) -> word == w end)
      {w, counter}
    end
  end

	def get_authors(commits) do
		authors = for commit <- commits, do: commit.author
		List.flatten(authors)
	end

	def get_branches_names(branches_string) do
		[_master|[_head| branches]] = String.split(branches_string, "\n  ")
		[_origin_master|branches] = Enum.reverse(branches)
		for branch <- branches do
      ["remotes", "origin", branch_name] =
				String.split(branch, "/")
			branch_name
		end
	end

end

defmodule UtilDate do

  def parse_date(date) do
    [day_in_week, month, day, hour, year, _zulu] = String.split(date, " ")
    month_number = get_month_number(month)
    day_number = complete_day.({String.length(day), day})
    date_parsed = "#{year}-#{month_number}-#{day_number}"
		{:ok, date_parsed, 0} = DateTime.from_iso8601("#{date_parsed}T#{hour}Z")
    {day_in_week, date_parsed}
  end

  defp complete_day do
    fn
      {2, day} -> day
      {1, day} -> "0#{day}"
    end
  end

  defp get_month_number(month) do
    months =
      %{
        "Jan" => "01",
        "Feb" => "02",
        "Mar" => "03",
        "Apr" => "04",
        "May" => "05",
        "Jun" => "06",
        "Jul" => "07",
        "Aug" => "08",
        "Sep" => "09",
        "Oct" => "10",
        "Nov" => "11",
        "Dec" => "12"
      }
		months[month]
  end

end
