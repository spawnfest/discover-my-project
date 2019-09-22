defmodule FrequencyEngine do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  def get_frequency(commits) do
    frequency_counters = %Frequency{}
    update_frequency_counters(commits, frequency_counters)
  end

  def update_frequency_counters([], frequency_counters), do: frequency_counters

  def update_frequency_counters([commit | commits], frequency_counters) do
    {day, date_created} = commit.date_created
    day_key = get_day_key(day)
    current_day = Map.get(frequency_counters, day_key)
    hour_key = String.to_atom("hour_#{date_created.hour}")
    hour_counter = Map.get(current_day, hour_key)
    current_day_updated = Map.put(current_day, hour_key, hour_counter + 1)
    frequency_counters_updated = Map.put(frequency_counters, day_key, current_day_updated)
    update_frequency_counters(commits, frequency_counters_updated)
  end

  defp get_day_key(day) do
    days = %{
      "Mon" => :monday,
      "Tue" => :tuesday,
      "Wed" => :wednesday,
      "Thu" => :thursday,
      "Fri" => :friday,
      "Sat" => :saturday,
      "Sun" => :sunday
    }

    days[day]
  end

  def get_chart_with_means(frequency) do
    frequency
    |> get_means()
    |> Utils.generate_chart_for_percentajes()
  end

  def get_means(frequency) do
    day_keys = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

    day_hours =
      for day <- day_keys do
        day = Map.get(frequency, day)
        [_struct | values] = Map.values(day)
        values
      end

    total_hours = day_hours |> List.flatten() |> Enum.sum()
    hours_per_day = for day_hour <- day_hours, do: Enum.sum(day_hour)
    get_means_per_day(total_hours, hours_per_day)
  end

  def get_means_per_day(total, hours_per_day) do
    for hours <- hours_per_day do
      mean = hours * 100 / total
      Kernel.trunc(mean)
    end
  end
end
