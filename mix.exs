defmodule Stytch.MixProject do
  use Mix.Project

  @source_url "https://github.com/moomerman/stytch-elixir"
  @version "0.4.4"

  def project do
    [
      app: :stytch,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Stytch",
      description: "An Elixir API Client for Stytch",
      source_url: @source_url,
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      files: ~w(lib config mix.exs README* LICENSE* CHANGELOG*),
      links: %{GitHub: @source_url},
      licenses: ["MIT"]
    ]
  end

  defp docs() do
    [
      extras: [
        "README.md": [title: "Overview"],
        "CHANGELOG.md": [title: "Changelog"],
        LICENSE: [title: "License"]
      ],
      main: "readme"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.5"},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end
end
