defmodule FrequencyEngineTest do
  use ExUnit.Case

  test "Getting the frequency" do
    commits = get_commits()
    frequency = FrequencyEngine.get_frequency(commits)
    assert frequency == expected_frequency()
  end

  test "Getting the frequency means" do
    commits = get_commits()
    frequency = FrequencyEngine.get_frequency(commits)
    means = FrequencyEngine.get_means(frequency)
    assert means == [0, 0, 50, 25, 0, 0, 25]
  end

  defp get_commits do
    [
      %Commit{
        author: "Chris McCord",
        date_created: {"Thu", ~U[2019-09-19 09:24:51Z]},
        description: "Only throttle repeat keys",
        hash: "01c0aea",
        words: ["Only", "throttle", "repeat", "keys"]
      },
      %Commit{
        author: "Andrey Zaika",
        date_created: {"Sun", ~U[2019-09-19 15:08:25Z]},
        description: "fix typo",
        hash: "681f98a",
        words: ["fix", "typo"]
      },
      %Commit{
        author: "GitHub",
        date_created: {"Wed", ~U[2019-09-18 21:42:15Z]},
        description: "Merge pull request #365 from preciz/master",
        hash: "0fd63f9",
        words: ["Merge", "pull", "request", "#365", "from", "preciz/master"]
      },
      %Commit{
        author: "Chris McCord",
        date_created: {"Wed", ~U[2019-09-18 21:40:34Z]},
        description: "Bump changelog",
        hash: "9edc2ca",
        words: ["Bump", "changelog"]
      }
    ]
  end

  def expected_frequency do
    %Frequency{
      friday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 0,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 0,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 0
      },
      monday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 0,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 0,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 0
      },
      saturday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 0,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 0,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 0
      },
      sunday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 1,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 0,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 0
      },
      thursday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 0,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 0,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 1
      },
      tuesday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 0,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 0,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 0
      },
      wednesday: %Day{
        hour_1: 0,
        hour_10: 0,
        hour_11: 0,
        hour_12: 0,
        hour_13: 0,
        hour_14: 0,
        hour_15: 0,
        hour_16: 0,
        hour_17: 0,
        hour_18: 0,
        hour_19: 0,
        hour_2: 0,
        hour_20: 0,
        hour_21: 2,
        hour_22: 0,
        hour_23: 0,
        hour_24: 0,
        hour_3: 0,
        hour_4: 0,
        hour_5: 0,
        hour_6: 0,
        hour_7: 0,
        hour_8: 0,
        hour_9: 0
      }
    }
  end
end
