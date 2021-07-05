defmodule PocNebulexCatchDups.MixProject do
  use Mix.Project

  def project do
    [
      app: :poc_nebulex_catch_dups,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PocNebulexCatchDups.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
       {:nebulex, "~> 2.1.1"},
       {:decorator,"~> 1.4.0"},
      #{:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
