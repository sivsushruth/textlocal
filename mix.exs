defmodule TextLocal.Mixfile do
  use Mix.Project

  def project do
    [
      app: :text_local,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      description: description(),
      package: package(),
      start_permanent: Mix.env == :prod,
      name: "TextLocal",
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:httpoison]
    ]
  end

  defp package() do
    [
      maintainers: ["Sushruth Sivaramakrishnan"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/sivsushruth/textlocal"}
    ]
  end


  defp description do
    """
    TextLocal API for Elixir and Erlang.
    """
  end


  defp deps do
    [
      {:httpoison, "~> 0.11"},
      {:poison, "~> 3.1"}
    ]
  end
end
