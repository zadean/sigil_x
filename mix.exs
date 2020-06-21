defmodule SigilX.MixProject do
  use Mix.Project

  def project do
    [
      app: :sigil_x,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      {:xs_regex, git: "https://github.com/zadean/xs_regex.git", branch: "main"}
    ]
  end
end
