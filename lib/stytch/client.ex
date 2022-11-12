defmodule Stytch.Client do
  # USERS

  @doc """
    See: https://stytch.com/docs/api/get-user
  """
  def get_user(user_id) do
    "/users/#{user_id}"
    |> get()
  end

  # MAGIC LINKS

  @doc """
    See: https://stytch.com/docs/api/send-by-email
  """
  def send_magic_link(email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/magic_links/email/send"
    |> post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-email
  """
  def login_or_create_user_by_email(email, opts \\ %{}) when is_binary(email) do
    "/magic_links/email/login_or_create"
    |> post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/invite-by-email
  """
  def invite_user_by_email(email, opts \\ %{}) do
    "/magic_links/email/invite"
    |> post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/revoke-pending-invite
  """
  def revoke_invite(email) when is_binary(email) do
    "/magic_links/email"
    |> post(%{email: email})
  end

  @doc """
    See: https://stytch.com/docs/api/create-magic-link
  """
  def create_embeddable_magic_link(user_id, opts \\ %{}) do
    "/magic_links"
    |> post(%{user_id: user_id} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/authenticate-magic-link
  """
  def authenticate_with_magic_link(token, opts \\ %{}) do
    "/magic_links/authenticate"
    |> post(%{token: token} |> Map.merge(opts))
  end

  # ONE-TIME PASSCODES (OTP)

  @doc """
    See: https://stytch.com/docs/api/send-otp-by-sms
  """
  def send_otp_by_sms(phone_number, opts \\ %{}) do
    "/otps/sms/send"
    |> post(%{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-sms
  """
  def login_or_create_user_by_sms(phone_number, opts \\ %{}) do
    "/otps/sms/login_or_create"
    |> post(%{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/authenticate-otp
  """
  def authenticate_otp(method_id, code) when is_binary(method_id) and is_binary(code) do
    "/otps/authenticate"
    |> post(%{method_id: method_id, code: code})
  end

  # PASSWORDS

  @doc """
    See: https://stytch.com/docs/api/password-create
  """
  def create_user_with_password(email, password, opts \\ %{})
      when is_binary(email) and is_binary(password)
      when is_map(opts) do
    "/passwords"
    |> post(%{email: email, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-authenticate
  """
  def authenticate_with_password(email, password, opts \\ %{})
      when is_binary(email) and is_binary(password) and is_map(opts) do
    "/passwords/authenticate"
    |> post(%{email: email, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-email-reset-start
  """
  def initiate_reset_password_by_email(email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/passwords/email/reset/start"
    |> post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-email-reset
  """
  def reset_password_by_email(token, password, opts \\ %{})
      when is_binary(token) and is_binary(password) do
    "/passwords/email/reset"
    |> post(%{token: token, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-existing-password-reset
  """
  def reset_password_by_existing(email, existing_password, new_password)
      when is_binary(email) and is_binary(existing_password) and is_binary(new_password) do
    "/passwords/existing_password/reset"
    |> post(%{email: email, existing_password: existing_password, new_password: new_password})
  end

  @doc """
    See: https://stytch.com/docs/api/password-session-reset
  """
  @spec reset_password_by_session(session_token :: String.t(), password :: String.t()) ::
          Req.Response.t()
  def reset_password_by_session(session_token, password)
      when is_binary(session_token) and is_binary(password) do
    "/passwords/session/reset"
    |> post(%{session_token: session_token, password: password})
  end

  @doc """
    See: https://stytch.com/docs/api/password-strength-check
  """
  def check_password_strength(password) when is_binary(password) do
    "/passwords/strength_check"
    |> post(%{password: password})
  end

  # SESSION MANAGEMENT

  @doc """
    See: https://stytch.com/docs/api/jwks-get
  """
  def get_jwks(project_id) when is_binary(project_id) do
    "/sessions/jwks/#{project_id}"
    |> get()
  end

  @doc """
    See: https://stytch.com/docs/api/session-get
  """
  def list_sessions(user_id) when is_binary(user_id) do
    "/sessions"
    |> get(user_id: user_id)
  end

  @doc """
    See: https://stytch.com/docs/api/session-auth
  """
  def authenticate_session(session_token, opts \\ %{})
      when is_binary(session_token) and is_map(opts) do
    "/sessions/authenticate"
    |> post(%{session_token: session_token} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/session-revoke
  """
  def revoke_session(session_id) when is_binary(session_id) do
    "/sessions/revoke"
    |> post(%{session_id: session_id})
  end

  # TIME-BASED ONE-TIME PASSCODS (TOTP)

  @doc """
    See: https://stytch.com/docs/api/totp-create
  """
  def create_totp(user_id, opts \\ %{}) do
    "/totps"
    |> post(%{user_id: user_id} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/totp-authenticate
  """
  def authenticate_totp(user_id, totp_code) do
    "/totps/authenticate"
    |> post(%{user_id: user_id, totp_code: totp_code})
  end

  @doc """
    See: https://stytch.com/docs/api/totp-get-recovery-codes
  """
  def get_totp_recovery_codes(user_id) do
    "/totps/recovery_codes"
    |> post(%{user_id: user_id})
  end

  @doc """
    See: https://stytch.com/docs/api/totp-recover
  """
  def recover_totp(user_id, recovery_code, opts \\ %{}) do
    "/totps/recover"
    |> post(%{user_id: user_id, recovery_code: recovery_code} |> Map.merge(opts))
  end

  def get(path, params \\ []), do: req() |> Req.get!(url: path, params: params)
  def post(path, body), do: req() |> Req.post!(url: path, json: body)

  defp req(), do: Req.new(base_url: endpoint(), auth: {username(), password()})
  defp endpoint, do: Application.get_env(:stytch, :endpoint)
  defp username, do: Application.get_env(:stytch, :project_id)
  defp password, do: Application.get_env(:stytch, :secret)
end
