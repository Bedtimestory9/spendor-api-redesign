defmodule Spendor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SpendorWeb.Telemetry,
      Spendor.Repo,
      {DNSCluster, query: Application.get_env(:spendor, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Spendor.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Spendor.Finch},
      # Start a worker by calling: Spendor.Worker.start_link(arg)
      # {Spendor.Worker, arg},
      # Start to serve requests, typically the last entry
      SpendorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spendor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpendorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
