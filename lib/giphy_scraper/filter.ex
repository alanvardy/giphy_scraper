defmodule GiphyScraper.Filter do
  alias GiphyScraper.GiphyImage
  def images([]), do: []

  def images([head | tail]), do: [into_image_struct(head)] ++ images(tail)

  defp into_image_struct(image) do
    id = image["id"]
    url = image["url"]
    author = image["username"]
    title = image["title"]

    %GiphyImage{id: id, url: url, author: author, title: title}
  end
end
