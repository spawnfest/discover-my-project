defmodule UtilDate do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
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
    months = %{
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
