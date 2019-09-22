defmodule NetworkConsumer do
  @moduledoc """
    Spawnfest :: Discover my project :: @carlogilmar :: 2019
  """
  @options [recv_timeout: 5000]

  def get(url) do
    response = HTTPoison.get!(url)
    get_response(response)
  end

  def get(url, headers) do
    response = HTTPoison.get!(url, headers, @options)
    get_response(response)
  end

  defp get_response(response) do
    {:ok, response_body} = Poison.decode(response.body)
    response_body
  end
end
