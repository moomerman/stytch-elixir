defmodule Stytch do
  @moduledoc """
  Documentation for `Stytch`.
  """
  alias Stytch.Client

  # USERS

  @doc """
    See: https://stytch.com/docs/api/create-user
  """
  def create_user_with_email(email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/users"
    |> Client.post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/create-user
  """
  def create_user_with_phone_number(phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/users"
    |> Client.post(%{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/search-users
  """
  def search_users(opts \\ %{}) when is_map(opts) do
    "/users/search"
    |> Client.post(opts)
  end

  @doc """
    See: https://stytch.com/docs/api/get-user
  """
  def get_user(user_id) when is_binary(user_id) do
    "/users/#{user_id}"
    |> Client.get()
  end

  @doc """
    See: https://stytch.com/docs/api/update-user
  """
  def update_user(user_id, opts \\ %{}) when is_binary(user_id) and is_map(opts) do
    "/users/#{user_id}"
    |> Client.put(opts)
  end

  @doc """
    https://stytch.com/docs/api/delete-user
  """
  def delete_user(user_id) when is_binary(user_id) do
    "/users/#{user_id}"
    |> Client.delete()
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-email
  """
  def delete_user_email(email_id) when is_binary(email_id) do
    "/users/emails/#{email_id}"
    |> Client.delete()
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-phone-number
  """
  def delete_user_phone_number(phone_id) when is_binary(phone_id) do
    "/users/phone_numbers/#{phone_id}"
    |> Client.delete()
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-totp
  """
  def delete_user_totp(totp_id) when is_binary(totp_id) do
    "/users/totps/#{totp_id}"
    |> Client.delete()
  end

  @doc """
    See: https://stytch.com/docs/api/delete-user-password
  """
  def delete_user_password(password_id) when is_binary(password_id) do
    "/users/passwords/#{password_id}"
    |> Client.delete()
  end

  @doc """
    See: https://stytch.com/docs/api/get-pending-users
  """
  def get_pending_users(opts \\ %{}) do
    "/users/pending"
    |> Client.get(opts)
  end

  # MAGIC LINKS

  @doc """
    See: https://stytch.com/docs/api/send-by-email
  """
  def send_magic_link(email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/magic_links/email/send"
    |> Client.post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-email
  """
  def login_or_create_user_by_email(email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/magic_links/email/login_or_create"
    |> Client.post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/invite-by-email
  """
  def invite_user_by_email(email, opts \\ %{}) when is_binary(email) and is_map(opts) do
    "/magic_links/email/invite"
    |> Client.post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/revoke-pending-invite
  """
  def revoke_invite(email) when is_binary(email) do
    "/magic_links/email"
    |> Client.post(%{email: email})
  end

  @doc """
    See: https://stytch.com/docs/api/create-magic-link
  """
  def create_embeddable_magic_link(user_id, opts \\ %{})
      when is_binary(user_id) and is_map(opts) do
    "/magic_links"
    |> Client.post(%{user_id: user_id} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/authenticate-magic-link
  """
  def authenticate_with_magic_link(token, opts \\ %{}) when is_binary(token) and is_map(opts) do
    "/magic_links/authenticate"
    |> Client.post(%{token: token} |> Map.merge(opts))
  end

  # ONE-TIME PASSCODES (OTP)

  @doc """
    See: https://stytch.com/docs/api/send-otp-by-sms
  """
  def send_otp_by_sms(phone_number, opts \\ %{}) when is_binary(phone_number) and is_map(opts) do
    "/otps/sms/send"
    |> Client.post(%{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/log-in-or-create-user-by-sms
  """
  def login_or_create_user_by_sms(phone_number, opts \\ %{})
      when is_binary(phone_number) and is_map(opts) do
    "/otps/sms/login_or_create"
    |> Client.post(%{phone_number: phone_number} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/authenticate-otp
  """
  def authenticate_otp(method_id, code) when is_binary(method_id) and is_binary(code) do
    "/otps/authenticate"
    |> Client.post(%{method_id: method_id, code: code})
  end

  # PASSWORDS

  @doc """
    See: https://stytch.com/docs/api/password-create
  """
  def create_user_with_password(email, password, opts \\ %{})
      when is_binary(email) and is_binary(password) and
             is_map(opts) do
    "/passwords"
    |> Client.post(%{email: email, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-authenticate
  """
  def authenticate_with_password(email, password, opts \\ %{})
      when is_binary(email) and is_binary(password) and is_map(opts) do
    "/passwords/authenticate"
    |> Client.post(%{email: email, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-email-reset-start
  """
  def initiate_reset_password_by_email(email, opts \\ %{})
      when is_binary(email) and is_map(opts) do
    "/passwords/email/reset/start"
    |> Client.post(%{email: email} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-email-reset
  """
  def reset_password_by_email(token, password, opts \\ %{})
      when is_binary(token) and is_binary(password) and is_map(opts) do
    "/passwords/email/reset"
    |> Client.post(%{token: token, password: password} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/password-existing-password-reset
  """
  def reset_password_by_existing(email, existing_password, new_password)
      when is_binary(email) and is_binary(existing_password) and is_binary(new_password) do
    "/passwords/existing_password/reset"
    |> Client.post(%{
      email: email,
      existing_password: existing_password,
      new_password: new_password
    })
  end

  @doc """
    See: https://stytch.com/docs/api/password-session-reset
  """
  def reset_password_by_session(session_token, password)
      when is_binary(session_token) and is_binary(password) do
    "/passwords/session/reset"
    |> Client.post(%{session_token: session_token, password: password})
  end

  @doc """
    See: https://stytch.com/docs/api/password-strength-check
  """
  def check_password_strength(password) when is_binary(password) do
    "/passwords/strength_check"
    |> Client.post(%{password: password})
  end

  # SESSION MANAGEMENT

  @doc """
    See: https://stytch.com/docs/api/jwks-get
  """
  def get_jwks(project_id) when is_binary(project_id) do
    "/sessions/jwks/#{project_id}"
    |> Client.get()
  end

  @doc """
    See: https://stytch.com/docs/api/session-get
  """
  def list_sessions(user_id) when is_binary(user_id) do
    "/sessions"
    |> Client.get(user_id: user_id)
  end

  @doc """
    See: https://stytch.com/docs/api/session-auth
  """
  def authenticate_session(session_token, opts \\ %{})
      when is_binary(session_token) and is_map(opts) do
    "/sessions/authenticate"
    |> Client.post(%{session_token: session_token} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/session-revoke
  """
  def revoke_session(session_id) when is_binary(session_id) do
    "/sessions/revoke"
    |> Client.post(%{session_id: session_id})
  end

  # TIME-BASED ONE-TIME PASSCODS (TOTP)

  @doc """
    See: https://stytch.com/docs/api/totp-create
  """
  def create_totp(user_id, opts \\ %{}) when is_binary(user_id) and is_map(opts) do
    "/totps"
    |> Client.post(%{user_id: user_id} |> Map.merge(opts))
  end

  @doc """
    See: https://stytch.com/docs/api/totp-authenticate
  """
  def authenticate_totp(user_id, totp_code) when is_binary(user_id) and is_binary(totp_code) do
    "/totps/authenticate"
    |> Client.post(%{user_id: user_id, totp_code: totp_code})
  end

  @doc """
    See: https://stytch.com/docs/api/totp-get-recovery-codes
  """
  def get_totp_recovery_codes(user_id) when is_binary(user_id) do
    "/totps/recovery_codes"
    |> Client.post(%{user_id: user_id})
  end

  @doc """
    See: https://stytch.com/docs/api/totp-recover
  """
  def recover_totp(user_id, recovery_code, opts \\ %{})
      when is_binary(user_id) and is_binary(recovery_code) and is_map(opts) do
    "/totps/recover"
    |> Client.post(%{user_id: user_id, recovery_code: recovery_code} |> Map.merge(opts))
  end
end
