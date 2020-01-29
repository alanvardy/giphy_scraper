defmodule GiphyScraper.GiphyImage do
  @enforce_keys [:id, :url, :author, :title]
  defstruct [:id, :url, :author, :title]
end
