defmodule GiphyScraper do
  @moduledoc "Pulls in the Giphy API"
  alias GiphyScraper.{GiphyImage, Request}

  @doc "Use the search endpoint with a query and an optional quantity"
  @spec search(String.t()) :: {:ok, [GiphyImage.t()]}
  def search(query, quantity \\ 25) do
    with {:ok, body} <- Request.search_endpoint(query, quantity),
         {:ok, content} <- Poison.decode(body),
         {:ok, images} <- Map.fetch(content, "data") do
      {:ok, Enum.map(images, &GiphyImage.convert/1)}
    else
      {:error, message} -> {:error, message}
      :error -> {:error, "Data key not found in content"}
    end
  end
end
