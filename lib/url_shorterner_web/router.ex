defmodule UrlShorternerWeb.Router do
  use UrlShorternerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  post "/", UrlShorternerWeb.UrlController, :create
  get "/:short_url", UrlShorternerWeb.UrlController, :lookup

end
