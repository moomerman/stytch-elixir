defmodule StytchTest do
  use ExUnit.Case
  doctest Stytch

  test "send_magic_link_by_email" do
    {:ok, res} = Stytch.send_magic_link_by_email("sandbox@stytch.com")
    assert res.status_code == 200
  end

  test "authenticate_magic_link" do
    {:ok, res} = Stytch.authenticate_magic_link("DOYoip3rvIMMW5lgItikFK-Ak1CfMsgjuiCyI7uuU94=")
    assert res.status_code == 200
  end

  test "send_otp_by_sms" do
    {:ok, res} = Stytch.send_otp_by_sms("+10000000000")
    assert res.status_code == 200
  end

  test "authenticate_session" do
    {:ok, res} = Stytch.authenticate_session("WJtR5BCy38Szd5AfoDpf0iqFKEt4EE5JhjlWUY7l3FtY")
    assert res.status_code == 200
  end

  test "create_otp" do
    {:ok, res} = Stytch.create_totp("user-test-e3795c81-f849-4167-bfda-e4a6e9c280fd")
    assert res.status_code == 200
  end

  test "error handling" do
    {:error, res} = Stytch.authenticate_session("INVALID")
    assert res.status_code == 400
  end
end
