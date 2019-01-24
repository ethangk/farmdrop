defmodule UrlShorternerWeb.Router do
  use UrlShorternerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # post "/" do
  #   IO.puts "Hit the post route"
  #   random_string = StringGenerator.string_of_length(5)
  #   UrlShorterner.Storage.set(random_string, conn.body_params["url"]) |> IO.inspect

  #   body_object = %{ short_url: random_string, url: conn.body_params["url"] }

  #   conn
  #     |> put_resp_content_type("application/json")
  #     |> send_resp(200, body_object |> Poison.encode!)
  # end

  post "/", UrlShorternerWeb.UrlController, :create
  get "/:url", UrlShorternerWeb.UrlController, :lookup

  # get "/:url" do
  #   # send_resp(conn, 200, "Hello #{url}")
  #   IO.puts "Attempting to get #{conn.params["url"]}"

  #   case UrlShorterner.Storage.get(conn.params["url"]) do
  #     {:found, result} -> conn |> Plug.Conn.resp(:moved_permanently, "") |> Plug.Conn.put_resp_header("location", result)
  #     {:not_found} -> conn |> send_resp(404, "Requested page not found!")
  #     _ -> conn |> send_resp(404, "Broken page")
  #   end
  # end

end
