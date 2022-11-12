# Stytch

An Elixir API client for [Stytch](https://stytch.com/docs/api)

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

## Documentation

The package docs can be found at <https://hexdocs.pm/stytch>.  

The full Stytch API documentation can be found at <https://stytch.com/docs/api>.

## Examples

These examples use sandbox values provided by Stytch so will return a valid
response but won't actually send anything.

### Magic Links

```elixir
Stytch.send_magic_link("sandbox@stytch.com")
```

```elixir
Stytch.authenticate_with_magic_link("DOYoip3rvIMMW5lgItikFK-Ak1CfMsgjuiCyI7uuU94=")
```

### One-time Passcodes (OTP)

```elixir
Stytch.send_otp_by_sms("+10000000000")
```

### Sessions

```elixir
Stytch.authenticate_session("WJtR5BCy38Szd5AfoDpf0iqFKEt4EE5JhjlWUY7l3FtY")
```

### Time-based one-time passcodes (TOTP)

```elixir
Stytch.create_totp("user-test-e3795c81-f849-4167-bfda-e4a6e9c280fd")
```