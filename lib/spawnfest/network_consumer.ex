defmodule NetworkConsumer do

  def get(url) do
    response = HTTPoison.get!(url)
    {:ok, response_body} = Poison.decode(response.body)
    response_body
  end
end
