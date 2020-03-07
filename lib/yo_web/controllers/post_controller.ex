defmodule YoWeb.PostController do
  use YoWeb, :controller

  alias Yo.Blog
  alias Yo.Blog.Post

  def index(conn, _params) do
    posts = Blog.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_comment(%Yo.Blog.Comment{})

    render(conn, "show.html", post: post, changeset: changeset)
  end

  def add_comment(conn, %{"post_id" => post_id, "comment" => comment_params}) do
    case Blog.create_comment(Map.put(comment_params, "post_id", post_id)) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        post = Blog.get_post!(post_id)
        render(conn, "show.html", changeset: changeset, post: post)
    end
  end
end
