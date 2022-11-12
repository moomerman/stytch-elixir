import Config

config :stytch,
  endpoint: System.get_env("STYTCH_ENDPOINT", "https://test.stytch.com/v1"),
  project_id: System.get_env("STYTCH_PROJECT_ID"),
  secret: System.get_env("STYTCH_SECRET")

import_config "#{Mix.env()}.exs"
