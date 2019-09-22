defmodule SpawnfestWeb.RepoView do
  use SpawnfestWeb, :view

  def show_heat_map_row(row) do
    set_class().(row)
  end

  def set_class do
    fn
      0 -> "background-color: #ffffff;"
      counter when counter in 1..5 -> "background-color: #c1f9e8a3;"
      counter when counter in 6..10 -> "background-color: #87f5d4;"
      counter when counter in 10..15 -> "background-color: #00ffb3;"
      counter when counter in 15..20 -> "background-color: #00c288;"
      _ -> "background-color: #017351;"
    end
  end
end
