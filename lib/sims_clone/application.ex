defmodule SimsClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SimsCloneWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:sims_clone, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SimsClone.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SimsClone.Finch},
      # Start a worker by calling: SimsClone.Worker.start_link(arg)
      # {SimsClone.Worker, arg},
      # Start to serve requests, typically the last entry
      SimsCloneWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimsClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimsCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
