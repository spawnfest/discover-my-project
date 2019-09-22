defmodule FrequencyEngine do
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
end
