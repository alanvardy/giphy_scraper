defmodule GiphyScraper.Request do
  def search_endpoint(query, number) do
    url = "api.giphy.com/v1/gifs/search"
    headers = [api_key: Application.get_env(:giphy_scraper, :api_key)]
    options = [params: %{q: query, limit: number}]

    case HTTPoison.get(url, headers, options) do
      {:ok, %{body: body}} -> {:ok, body}
      {:error, _content} -> {:error, "Not able to access Giphy API"}
    end
  end
end
