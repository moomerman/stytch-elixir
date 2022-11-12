# Stytch

An Elixir API client for [Stytch](https://stytch.com)

## Installation

The package can be installed by adding `stytch` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stytch, "~> 0.1.0"}
  ]
end
```

## Configuration

To make API calls you need to configure your Stytch `project_id` and `secret`.

If you set the `STYTCH_PROJECT_ID` and `STYTCH_SECRET` environment variables
then they will be used.

You can also override the configuration in your application config:

```elixir
config :stytch,
  project_id: "my-project-id",
  secret: "my-secret"
```

The default endpoint for API requests is https://test.stytch.com/v1 and in
prod environments is https://api.stytch.com/v1 but these can be
overridden by the `STYTCH_ENDPOINT` environment variable or `:endpoint`
config option.

The docs can be found at <https://hexdocs.pm/stytch>.

## Examples

### Magic Links

```elixir
Stytch.send_magic_link("sandbox@stytch.com")

```

### One-time Passcodes (OTP)

```elixir
Stytch.send_otp_by_sms("+10000000000")
```

### Time-based one-time passcodes (TOTP)

```elixir
Stytch.create_totp("user-id-....")
```