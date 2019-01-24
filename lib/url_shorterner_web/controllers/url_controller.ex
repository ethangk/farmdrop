defmodule StringGenerator do
  @chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("")

  def string_of_length(length) do
    Enum.reduce((1..length), [], fn (_i, acc) ->
      [Enum.random(@chars) | acc]
    end) |> Enum.join("")
  end
end

defmodule UrlShorternerWeb.UrlController do
  use UrlShorternerWeb, :controller

  alias UrlShorterner.Web
  alias UrlShorterner.Web.Url

  action_fallback UrlShorternerWeb.FallbackController

  def create(conn, %{"url" => url_params}) do
    IO.puts "Hit the post route"
    random_string = StringGenerator.string_of_length(5)
    UrlShorterner.Storage.set(random_string, conn.body_params["url"]) |> IO.inspect

    body_object = %{ short_url: random_string, url: conn.body_params["url"] }

    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, body_object |> Poison.encode!)
  end

  def lookup(conn, %{"url" => url}) do
    IO.puts "Attempting to get #{url}"

    # case UrlShorterner.Storage.get(url) do
    #   {:found, result} -> conn |> Plug.Conn.resp(:moved_permanently, "") |> Plug.Conn.put_resp_header("location", result)
    #   {:not_found} -> conn |> send_resp(404, "Requested page not found!")
    #   _ -> conn |> send_resp(404, "Broken page")
    # end
  end
end
