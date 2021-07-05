defmodule PocNebulexCatchDups.Cache do
  use Nebulex.Cache,
    otp_app: :poc_nebulex_catch_dups,
    adapter: Nebulex.Adapters.Local
end

defmodule PocNebulexCatchDups.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: PocNebulexCatchDups.Worker.start_link(arg)
      # {PocNebulexCatchDups.Worker, arg}
      {PocNebulexCatchDups.Cache, []},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PocNebulexCatchDups.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
