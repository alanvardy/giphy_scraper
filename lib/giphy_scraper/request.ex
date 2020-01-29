defmodule GiphyScraper.Request do
  @moduledoc "Make a query to Giphy's search endpoint"

  @spec search_endpoint(String.t(), pos_integer) ::
          {:ok, String.t()} | {:error, String.t()}
  def search_endpoint(query, quantity) do
    url = "api.giphy.com/v1/gifs/search"
    headers = [api_key: api_key()]
    options = [params: %{q: query, limit: quantity}]

    case HTTPoison.get(url, headers, options) do
      {:ok, %{body: body, status_code: 200}} -> {:ok, body}
      _ -> {:error, "Not able to access Giphy API"}
    end
  end

  @spec api_key :: String.t()
  defp api_key() do
    Application.get_env(:giphy_scraper, :api_key)
  end
end
