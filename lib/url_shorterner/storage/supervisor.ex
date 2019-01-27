defmodule UrlShorterner.Storage.Supervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(UrlShorterner.Storage, [[name: UrlShorterner.Storage]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end