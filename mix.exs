defmodule Stytch.MixProject do
  use Mix.Project

  def project do
    [
      app: :stytch,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Stytch",
      description: "API Client for Stytch.com",
      source_url: "https://github.com/moomerman/stytch-ex",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Stytch.Application, []}
    ]
  end

  defp package() do
    [
      files: ~w(lib mix.exs README* LICENSE*),
      links: %{GitHub: "https://github.com/moomerman/stytch-ex"},
      licenses: ["MIT"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.3.1"},
      {:ex_doc, "0.29.0", only: :dev, runtime: false}
    ]
  end
end
