import Config

config :stytch,
  endpoint: System.get_env("STYTCH_ENDPOINT", "https://api.stytch.com/v1")
