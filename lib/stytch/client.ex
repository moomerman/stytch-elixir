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

  defp response({:ok, %Req.Response{status: status} = res}) when status >= 200 and status < 300,
    do: {:ok, %Stytch.Response{headers: res.headers, body: res.body, status: res.status}}

  defp response({:ok, res}),
    do: {:error, %Stytch.Response{headers: res.headers, body: res.body, status: res.status}}

  defp response(res), do: res

  defp req(), do: Req.new(base_url: endpoint(), auth: {username(), password()})
  defp endpoint, do: get_env(:endpoint, @endpoint_env_var, @default_endpoint)
  defp username, do: get_env(:project_id, @project_id_env_var)
  defp password, do: get_env(:secret, @secret_env_var)

  defp get_env(key, env_var, default \\ nil),
    do:
      Application.get_env(:stytch, key) ||
        if(default, do: System.get_env(env_var, default), else: System.fetch_env!(env_var))
end
