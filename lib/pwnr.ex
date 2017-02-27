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
      |> Enum.map(&Task.await(&1, :infinity))
      |> parse_results
  end

  defp parse_results(results) do
    {successes, _failures} =
      results
        |> Enum.partition(fn x ->
             case x do
               {:ok, _} -> true
               _        -> false
           end
        end)

    total_workers = Enum.count(results)
    total_success = Enum.count(successes)
    total_failure = total_workers - total_success

    data = successes |> Enum.map(fn {:ok, time} -> time end)
    ave_time = average(data)
    min_time = Enum.min(data)
    max_time = Enum.max(data)

    IO.puts """
    Total workers    : #{total_workers}
    Successful reqs  : #{total_success}
    Failed reqs      : #{total_failure}
    Average (msecs)  : #{ave_time}
    Longest (msecs)  : #{max_time}
    Shortest (msecs) : #{min_time}
    """
  end

  defp average(list) do
    sum = Enum.sum(list)
    if sum > 0 do
      sum / Enum.count(list)
    else
      0
    end
  end
end
