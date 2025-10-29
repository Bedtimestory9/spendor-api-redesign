defmodule Spendor.Repo do
  use Ecto.Repo,
    otp_app: :spendor,
    adapter: Ecto.Adapters.Postgres
end
