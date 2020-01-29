defmodule GiphyScraper.GiphyImage do
  @moduledoc "Representation of a Giphy Image"

  @enforce_keys [:id, :url, :author, :title]
  defstruct [:id, :url, :author, :title]
  @type t :: %__MODULE__{id: String.t(), url: String.t(), author: String.t(), title: String.t()}

  @spec convert(map) :: t()
  def convert(image) do
    id = image["id"]
    url = image["url"]
    author = image["username"]
    title = image["title"]

    %__MODULE__{id: id, url: url, author: author, title: title}
  end
end
