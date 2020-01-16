defmodule YoWeb.PageController do
  use YoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
