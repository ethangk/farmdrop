defmodule UrlShorterner.Storage.Url do
  @enforce_keys [:url, :short_url]
  defstruct [:url, :short_url]

  def format(url) do
    case Regex.match?(~r/^(http|https):\/\//i, url) do
      true -> url
      _ -> "http://" <> url
    end
  end
end