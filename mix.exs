defmodule Confix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :confix,
      version: "0.4.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      aliases: aliases(),
      preferred_cli_env: [
        check: :test
      ],
      name: "Confix",
      description: "Read, parse and patch Elixir application's configuration",
      source_url: "https://github.com/surgeventures/confix",
      homepage_url: "https://github.com/surgeventures/confix",
      docs: [main: "readme", extras: ["README.md"]]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/surgeventures/confix",
        "Fresha" => "https://www.fresha.com"
      },
      files: ~w(mix.exs lib LICENSE.md README.md)
    ]
  end

  def application do
    [mod: {Confix.Application, []}, extra_applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      check: check_alias()
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  defp check_alias do
    [
      "format --check-formatted",
      "compile --warnings-as-errors --force",
      "test",
      "credo --strict"
    ]
  end
end
