defmodule UrlShorterner.Web do
  @moduledoc """
  The Web context.
  """

  alias UrlShorterner.Repo

  alias UrlShorterner.Web.Url

  @doc """
  Returns the list of urls.

  ## Examples

      iex> list_urls()
      [%Url{}, ...]

  """
  def list_urls do
    raise "TODO"
  end

  @doc """
  Gets a single url.

  Raises if the Url does not exist.

  ## Examples

      iex> get_url!(123)
      %Url{}

  """
  def get_url!(id), do: raise "TODO"

  @doc """
  Creates a url.

  ## Examples

      iex> create_url(%{field: value})
      {:ok, %Url{}}

      iex> create_url(%{field: bad_value})
      {:error, ...}

  """
  def create_url(attrs \\ %{}) do
    raise "TODO"
  end

end
