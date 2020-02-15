defmodule YoWeb.Router do
  use YoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", YoWeb do
    pipe_through :browser

    resources "/posts", PostController

    get "/", PageController, :index
  end

  scope "/api", YoWeb.Api do
    pipe_through :api
    resources "/posts", PostController, only: [:show, :index]
  end
end
