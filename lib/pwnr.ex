defmodule Pwnr do
  @moduledoc """
  """

  alias Pwnr.Worker

  @doc """
  """
  def run(n_workers, url) when n_workers > 0 do
    worker_fun = fn -> Worker.start(url) end

    1..n_workers
    |> Enum.map(fn _ -> Task.async(worker_fun) end)
    |> Enum.map(&Task.await(&1))
  end
end
