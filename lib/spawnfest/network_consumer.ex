defmodule NetworkConsumer do

  def get(url) do
    response = HTTPoison.get!(url)
    get_response(response)
  end

  def get(url, headers) do
    response = HTTPoison.get!(url, headers)
    get_response(response)
  end

  defp get_response(response) do
    {:ok, response_body} = Poison.decode(response.body)
    response_body
  end
end
