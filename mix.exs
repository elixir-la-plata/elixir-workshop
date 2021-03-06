defmodule Yo.MixProject do
  use Mix.Project

  def project do
    [
      app: :yo,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Yo.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.11"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:earmark, "~> 1.4"},
      {:ex_doc, "~> 0.21", only: :dev}
    ]
  end

  defp docs do
    [
      app: "Elixir Workshop",
      name: "Elixir Workshop",
      api_reference: false,
      main: "readme",
      source_url: "https://github.com/nicanor/elixir-workshop",
      groups_for_modules: [
        Blog: ~r/Yo.Blog/,
        Routes: ["YoWeb.Router.Helpers"],
        Controllers: ~r/Controller/,
        Plugs: ~r/Plug/,
        Others: ["Yo", "Yo.Repo", "YoWeb", "YoWeb.Endpoint", "YoWeb.Gettext"]
      ],
      extras: [
        "README.md": [title: "Welcome"],
        "priv/pages/introduction/contributing.md": [title: "Contributing"],
        "priv/pages/introduction/style_guide.md": [title: "Style Guide"]
      ],
      groups_for_extras: [
        Introduction: ["README.md"],
        Introduction: Path.wildcard("priv/pages/introduction/*.md")
      ]
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
