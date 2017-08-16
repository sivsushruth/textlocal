defmodule TextLocal do
  alias TextLocal.Api

  def send!(numbers, message), do: send!(numbers, message, %{})
  def send!(number, message, optional_params) when is_binary(number), do: send!([number], message, optional_params)
  def send!(numbers, message, optional_params) when is_list(numbers) do
    auth_config = get_auth_config(%{hash: get_config(:hash), apikey: get_config(:api_key), sender: get_config(:sender), username: get_config(:username)})

    payload = auth_config
    |> maybe_add_test
    |> Map.merge(optional_params)
    |> Map.put(:numbers, Enum.join(numbers, ","))
    |> Map.put(:message, message)
    |> URI.encode_query

    ("send?" <> payload)
    |> Api.get!
    |> Map.get(:body)
  end

  defp get_config(key) do
    Application.get_env(:text_local, key)
  end

  defp maybe_add_test(data) do
    is_test = get_config(:test)
    case is_test do
      true -> Map.put(data, :test, true)
      _ -> data
    end
  end

  defp get_auth_config(%{hash: hash, apikey: apikey, sender: sender, username: username}) do
    case {hash, apikey, sender, username} do
      {hash, _, _, username} when is_binary(hash) and is_binary(username) -> %{hash: hash, sender: sender, username: username}
      {_, apikey, _, _} when is_binary(apikey) -> %{api_key: hash, sender: sender}
      _ -> %{}
    end
  end
end
