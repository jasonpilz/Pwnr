defmodule Pwnr.Mixfile do
  use Mix.Project

  def project do
    [app: :pwnr,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      extra_applications: [
        :logger,
        :httpoison,
        :timex,
        :tzdata
      ]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11.0"},
      {:timex, "~> 3.1"},
      {:tzdata, "~> 0.5.10"}
    ]
  end
end
