defmodule YoWeb.Plugs.Count do
  import Plug.Conn
  alias Yo.Blog

  def init(default), do: default

  def call(conn, options) do
    Blog.increment_counter()
    new_count = Blog.get_counter()

    Plug.Conn.assign(conn, :counter, new_count)
  end
end
