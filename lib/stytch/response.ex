defmodule Stytch.Response do
  @enforce_keys [:headers, :body, :status]
  defstruct [:headers, :body, :status]
end
