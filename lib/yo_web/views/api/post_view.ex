defmodule YoWeb.Api.PostView do
  @moduledoc false
  use YoWeb, :view

  def render("index.json", %{posts: posts}) do
    render_many(posts, YoWeb.Api.PostView, "show.json")
  end

  def render("show.json", %{post: post}) do
    %{id: post.id, title: post.title, body: :body}
  end
end
