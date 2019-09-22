defmodule Branch do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [:commits, :authors, :words, :frequency]
end

defmodule Commit do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [:hash, :description, :author, :date_created, :words]
end

defmodule Day do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct hour_0: 0,
            hour_1: 0,
            hour_2: 0,
            hour_3: 0,
            hour_4: 0,
            hour_5: 0,
            hour_6: 0,
            hour_7: 0,
            hour_8: 0,
            hour_9: 0,
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
            hour_20: 0,
            hour_21: 0,
            hour_22: 0,
            hour_23: 0,
            hour_24: 0
end

defmodule Frequency do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct monday: %Day{},
            tuesday: %Day{},
            wednesday: %Day{},
            thursday: %Day{},
            friday: %Day{},
            saturday: %Day{},
            sunday: %Day{}
end

defmodule GitHubRepository do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [
    :fullname,
    :avatar_url,
    :description,
    :open_issues,
    :forks,
    :language,
    :default_branch
  ]
end

defmodule GitHubIssue do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [:url, :title, :state, :date_created]
end

defmodule GitHubPR do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [:number, :url, :title, :state, :author]
end

defmodule GitHubContributor do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  defstruct [:avatar_url, :username, :contributions]
end
