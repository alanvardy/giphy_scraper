defmodule GiphyScraper do
  alias GiphyScraper.{Filter, Request}

  @moduledoc """
  Documentation for `GiphyScraper`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GiphyScraper.hello()
      :world

  """

  def search(query, number \\ 25) do
    with {:ok, body} <- Request.search_endpoint(query, number),
         {:ok, content} <- Poison.decode(body),
         {:ok, images} <- Map.fetch(content, "data") do
      Filter.images(images)
    else
      {:error, message} -> {:error, message}
    end
  end
end
