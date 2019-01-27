defmodule UrlShorternerWeb.UrlController do
  use UrlShorternerWeb, :controller

  alias UrlShorterner.Web
  alias UrlShorterner.Storage.Url

  action_fallback UrlShorternerWeb.FallbackController

  def create(conn, body) do
    body |> IO.inspect

    case body do
      %{ "url" => "" } -> conn |> send_resp(422, %{ error: "Invalid URL"} |> Poison.encode!)
      %{ "url" => url } -> conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Url.format(url) |> UrlShorterner.Storage.set |> Poison.encode!)
      _ -> conn |> send_resp(422, %{ error: "Unprocessable URL"} |> Poison.encode!)
    end
    
  end

  def lookup(conn, %{"short_url" => short_url}) do
    case UrlShorterner.Storage.get(short_url) do
      {:found, result} -> conn
                          |> Plug.Conn.resp(:moved_permanently, %{ url: result.url } |> Poison.encode!)
                          |> Plug.Conn.put_resp_header("location", result.url)
      {:not_found} -> conn |> send_resp(404, "Requested page not found!")
      _ -> conn |> send_resp(405, "Broken page")
    end
  end
end
