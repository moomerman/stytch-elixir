defmodule Stytch.Client do
  @moduledoc """
  API Client wrapper and configuration.
  """

  @default_endpoint "https://test.stytch.com/v1"

  @endpoint_env_var "STYTCH_ENDPOINT"
  @project_id_env_var "STYTCH_PROJECT_ID"
  @secret_env_var "STYTCH_SECRET"

  def get(path, params \\ []), do: req() |> Req.get(url: path, params: params) |> response()
  def post(path, body), do: req() |> Req.post(url: path, json: body) |> response()
  def delete(path, params \\ []), do: req() |> Req.delete(url: path, params: params) |> response()

  defp response({:ok, %Req.Response{status: status} = res}) when status >= 200 and status < 300 do
    {:ok, atomize_keys(res.body)}
  end

  defp response({:ok, res}), do: {:error, atomize_keys(res.body)}
  defp response(res), do: res

  defp atomize_keys(map = %{}) do
    map
    |> Enum.map(fn {k, v} -> {String.to_atom(k), atomize_keys(v)} end)
    |> Enum.into(%{})
  end

  defp atomize_keys([head | rest]), do: [atomize_keys(head) | atomize_keys(rest)]
  defp atomize_keys(not_a_map), do: not_a_map

  defp req(), do: Req.new(base_url: endpoint(), auth: {username(), password()})
  defp endpoint, do: get_env(:endpoint, @endpoint_env_var, @default_endpoint)
  defp username, do: get_env(:project_id, @project_id_env_var)
  defp password, do: get_env(:secret, @secret_env_var)

  defp get_env(key, env_var, default \\ nil) do
    Application.get_env(:stytch, key) ||
      if(default, do: System.get_env(env_var, default), else: System.fetch_env!(env_var))
  end
end
