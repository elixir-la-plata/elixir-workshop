defmodule Yo.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Yo.Blog.Post

  schema "comments" do
    field :body, :string
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:post_id, :body])
    |> validate_required([:post_id, :body])
  end
end
