defmodule YoWeb.Plugs.Unauthorized do
  @moduledoc false

  import Plug.Conn

  def init(default), do: default

  def call(conn, options) do
    message = options[:message] || "No autorizado"

    conn
    |> Plug.Conn.resp(401, message)
    |> halt()
  end
end
