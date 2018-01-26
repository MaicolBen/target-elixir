defmodule TargetWeb.Router do
  use TargetWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  # Add this block
 pipeline :protected do
   plug :accepts, ["html"]
   plug :fetch_session
   plug :fetch_flash
   plug :protect_from_forgery
   plug :put_secure_browser_headers
   plug Coherence.Authentication.Session, protected: true
 end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", TargetWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", TargetWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  # scope "/", TargetWeb do
  #   pipe_through :protected
  #
  #   # add protected resources below
  #   resources "/privates", PrivateController
  # end

  # Other scopes may use custom stacks.
  # scope "/api", TargetWeb do
  #   pipe_through :api
  # end
end
