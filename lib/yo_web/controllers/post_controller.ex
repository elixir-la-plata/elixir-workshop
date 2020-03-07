defmodule YoWeb.PostController do
  use YoWeb, :controller

  alias Yo.Blog
  alias Yo.Blog.Post

  def index(conn, _params) do
    posts = Blog.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Blog.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Blog.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_comment(%Yo.Blog.Comment{})

    render(conn, "show.html", post: post, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blog.get_post!(id)

    case Blog.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
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

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    {:ok, _post} = Blog.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
