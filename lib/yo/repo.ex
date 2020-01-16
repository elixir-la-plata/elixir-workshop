defmodule Yo.Repo do
  use Ecto.Repo,
    otp_app: :yo,
    adapter: Ecto.Adapters.Postgres
end
