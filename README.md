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

{:ok,
 %{
   email_id: "email-test-23873e89-d4ed-4e92-b3b9-e5c7198fa286",
   request_id: "request-id-test-66d49012-2b36-4835-9093-2a51f4ba3570",
   status_code: 200,
   user_id: "user-test-e3795c81-f849-4167-bfda-e4a6e9c280fd"
 }}
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

## Handling errors

Succesful API calls return a `{:ok, map()}` response.

If the API returns an error you'll get a `{:error, map()}` response with 
the error information:

```elixir
Stytch.authenticate_session("INVALID")

{:error,
 %{
   error_message: "Session token format is invalid.",
   error_type: "invalid_session_token",
   error_url: "https://stytch.com/docs/api/errors/400",
   request_id: "request-id-test-f64acf06-8a0a-4b45-9fbd-bfc3b5ca7f50",
   status_code: 400
 }}
```