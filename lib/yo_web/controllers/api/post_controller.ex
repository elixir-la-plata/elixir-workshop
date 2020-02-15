defmodule YoWeb.Api.PostController do
  use YoWeb, :controller
  alias Yo.Blog

  def index(conn, _params) do
    posts = Blog.list_posts()
    render(conn, "index.json", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    render(conn, "show.json", post: post)
  end
end
