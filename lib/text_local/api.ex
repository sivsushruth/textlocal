defmodule TextLocal.Api do
  use HTTPoison.Base

  @expected_fields ~w(errors status warnings messages message num_messages cost batch_id balance)

  def process_url(path) do
    "https://api.textlocal.in/" <> path
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end