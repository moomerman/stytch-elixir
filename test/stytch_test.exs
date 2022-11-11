defmodule StytchTest do
  use ExUnit.Case
  doctest Stytch

  test "greets the world" do
    assert Stytch.hello() == :world
  end
end
