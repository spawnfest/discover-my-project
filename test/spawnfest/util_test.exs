defmodule SpawnfestTest do
  use ExUnit.Case

  test "Getting commits from log" do
    commit_history = "0039d22<->José Valim<->Clean up channel state and track duplicate IDs on client'\n'8a679d0<->GitHub<->Merge pull request #376 from holandes22/fix-typo'\n'6daed95<->José Valim<->Remove live reload step already in Phoenix'\n'9215621<->José Valim<->Simplify install steps'\n'd1f603c<->Pablo Klijnjan<->fix typo'\n'15ab552<->Chris McCord<->Bump changelog'\n'f658d0d<->Chris McCord<->Do not walk non element parts of DOM'\n'db66c10<->GitHub<->Merge pull request #374 from schrockwell/add-binding-docs'\n'9f72779<->Rockwell Schrock<->Add table of contents for phx-* binding attributes'\n'98773aa<->José Valim<->Store temporary assigns in private to reduce amount of Socket fields'\n'61067e1<->José Valim<->Remember users to install Floki"
    commits_expected = get_commits_expected()
    commits = Utils.get_commits(commit_history)
    assert commits == commits_expected
  end

  test "Getting commit from string line" do
    string_line = "0039d22<->José Valim<->Clean up channel state and track duplicate IDs on client"
    commit = Utils.get_commit(string_line)
    commit_expected =
      %Commit{
        author: "José Valim",
        description: "Clean up channel state and track duplicate IDs on client",
        hash: "0039d22",
        words: ["Clean", "up", "channel", "state", "and", "track", "duplicate",
          "IDs", "on", "client"]
      }
    assert commit == commit_expected
  end

  defp get_commits_expected do
    [
      %Commit{
        author: "José Valim",
        description: "Clean up channel state and track duplicate IDs on client",
        hash: "0039d22",
        words: ["Clean", "up", "channel", "state", "and", "track", "duplicate",
          "IDs", "on", "client"]
      },
      %Commit{
        author: "GitHub",
        description: "Merge pull request #376 from holandes22/fix-typo",
        hash: "8a679d0",
        words: ["Merge", "pull", "request", "#376", "from", "holandes22/fix-typo"]
      },
      %Commit{
        author: "José Valim",
        description: "Remove live reload step already in Phoenix",
        hash: "6daed95",
        words: ["Remove", "live", "reload", "step", "already", "in", "Phoenix"]
      },
      %Commit{
        author: "José Valim",
        description: "Simplify install steps",
        hash: "9215621",
        words: ["Simplify", "install", "steps"]
      },
      %Commit{
        author: "Pablo Klijnjan",
        description: "fix typo",
        hash: "d1f603c",
        words: ["fix", "typo"]
      },
      %Commit{
        author: "Chris McCord",
        description: "Bump changelog",
        hash: "15ab552",
        words: ["Bump", "changelog"]
      },
      %Commit{
        author: "Chris McCord",
        description: "Do not walk non element parts of DOM",
        hash: "f658d0d",
        words: ["Do", "not", "walk", "non", "element", "parts", "of", "DOM"]
      },
      %Commit{
        author: "GitHub",
        description: "Merge pull request #374 from schrockwell/add-binding-docs",
        hash: "db66c10",
        words: ["Merge", "pull", "request", "#374", "from",
          "schrockwell/add-binding-docs"]
      },
      %Commit{
        author: "Rockwell Schrock",
        description: "Add table of contents for phx-* binding attributes",
        hash: "9f72779",
        words: ["Add", "table", "of", "contents", "for", "phx-*", "binding",
          "attributes"]
      },
      %Commit{
        author: "José Valim",
        description: "Store temporary assigns in private to reduce amount of Socket fields",
        hash: "98773aa",
        words: ["Store", "temporary", "assigns", "in", "private", "to", "reduce",
          "amount", "of", "Socket", "fields"]
      },
      %Commit{
        author: "José Valim",
        description: "Remember users to install Floki",
        hash: "61067e1",
        words: ["Remember", "users", "to", "install", "Floki"]
      }
      ]
  end
end
