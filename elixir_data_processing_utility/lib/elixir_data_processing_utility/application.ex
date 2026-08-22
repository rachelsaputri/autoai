defmodule ElixirDataProcessingUtility.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Define workers and child supervisors to be supervised
      # ElixirDataProcessingWorker
    ]

    opts = [strategy: :one_for_one, name: ElixirDataProcessingUtility.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
