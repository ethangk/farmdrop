# Taken from https://stackoverflow.com/a/45985053
defmodule UrlShorterner.Storage.StringGenerator do
  @alphabet Enum.concat([?0..?9, ?A..?Z, ?a..?z])

  def rand_string(count) do
    Stream.repeatedly(&random_char_from_alphabet/0)
    |> Enum.take(count)
    |> List.to_string()
  end

  defp random_char_from_alphabet() do
    Enum.random(@alphabet)
  end
end