defmodule UrlShorterner.Storage do
  use GenServer
  alias UrlShorterner.Storage.Url
  alias UrlShorterner.Storage.StringGenerator

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [
      {:ets_table_name, :url_shorterner_storage},
      {:log_limit, 1_000_000}
    ], opts)
  end

  def get(short_url) do
    case GenServer.call(__MODULE__, {:get, short_url}) do
      [] -> {:not_found}
      [{_short_url, result}] -> {:found, %Url{ url: result, short_url: short_url }}
    end
  end

  def set(short_url, url) do
    GenServer.call(__MODULE__, {:set, short_url, url})
    %Url{
      url: url,
      short_url: short_url
    }
  end

  def set(url) do
    short_url = StringGenerator.rand_string(5)
    set(short_url, url)
  end

  # GenServer callbacks

  def handle_call({:get, short_url}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    result = :ets.lookup(ets_table_name, short_url)
    {:reply, result, state}
  end

  def handle_call({:set, short_url, value}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    true = :ets.insert(ets_table_name, {short_url, value})
    {:reply, value, state}
  end

  def init(args) do
    [{:ets_table_name, ets_table_name}, {:log_limit, log_limit}] = args

    :ets.new(ets_table_name, [:named_table, :set, :private])

    {:ok, %{log_limit: log_limit, ets_table_name: ets_table_name}}
  end
end