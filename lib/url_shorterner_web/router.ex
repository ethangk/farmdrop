defmodule UrlShorternerWeb.Router do
  use UrlShorternerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UrlShorternerWeb do
    pipe_through :api
  end
end
