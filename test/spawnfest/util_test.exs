defmodule UtilTest do
  use ExUnit.Case

  test "Getting commits from log" do
    commit_history = "'0039d22<->José Valim<->Sat Sep 21 16:35:21 2019 +0200<->Clean up channel state and track duplicate IDs on client'\n'8a679d0<->GitHub<->Sat Sep 21 08:44:59 2019 -0400<->Merge pull request #376 from holandes22/fix-typo'\n'6daed95<->José Valim<->Sat Sep 21 13:32:06 2019 +0200<->Remove live reload step already in Phoenix'\n'9215621<->José Valim<->Sat Sep 21 13:28:49 2019 +0200<->Simplify install steps'\n'd1f603c<->Pablo Klijnjan<->Sat Sep 21 07:35:54 2019 +0300<->fix typo'\n'15ab552<->Chris McCord<->Fri Sep 20 17:35:21 2019 -0400<->Bump changelog'\n'f658d0d<->Chris McCord<->Fri Sep 20 16:17:47 2019 -0400<->Do not walk non element parts of DOM'\n'db66c10<->GitHub<->Fri Sep 20 14:28:58 2019 -0400<->Merge pull request #374 from schrockwell/add-binding-docs'\n'9f72779<->Rockwell Schrock<->Fri Sep 20 13:41:31 2019 -0400<->Add table of contents for phx-* binding attributes"
    commits = Utils.get_commits(commit_history)
    assert length(commits) == 9
  end

  test "Getting commit from string line" do
    string_line = "0039d22<->José Valim<->Thu Sep 5 20:03:28 2019 +0200<->Clean up channel state and track duplicate IDs on client"
    commit = Utils.get_commit(string_line)
    commit_expected =
      %Commit{
        author: "José Valim",
        description: "Clean up channel state and track duplicate IDs on client",
        hash: "0039d22",
        date_created: {"Thu", ~U[2019-09-05 20:03:28Z]},
        words: ["Clean", "up", "channel", "state", "and", "track", "duplicate",
          "IDs", "on", "client"]
      }
    assert commit == commit_expected
  end

  test "Count the times that a word appear" do
    words = ["word1", "word2", "word3", "word2", "word3", "word1", "word2"]
    words_counters = Utils.get_words_counters(words)
    words_countes_expected = [{"word1", 2}, {"word3", 2}, {"word2", 3}]
    assert words_counters == words_countes_expected
  end

	test "Getting branches names" do
		string = "* master\n  remotes/origin/HEAD -> origin/master\n  remotes/origin/cm-component-id\n  remotes/origin/cm-js-interop\n  remotes/origin/cm-live-view-test\n  remotes/origin/cm-mount-opts\n  remotes/origin/cm-refactor-test\n  remotes/origin/gr-array-buffer\n  remotes/origin/gr-upload-channel\n  remotes/origin/jv-live-nav-changes\n  remotes/origin/master\n"
		branches = Utils.get_branches_names(string)
		expected_branches = ["jv-live-nav-changes", "gr-upload-channel", "gr-array-buffer", "cm-refactor-test", "cm-mount-opts", "cm-live-view-test", "cm-js-interop", "cm-component-id"]
		assert branches == expected_branches
	end

  test "Getting date from string date created commit" do
    date = "Tue Sep 17 15:09:01 2019 -0400"
    date_parsed = UtilDate.parse_date(date)
    assert date_parsed == {"Tue", ~U[2019-09-17 15:09:01Z]}
  end

end
