# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :target,
  ecto_repos: [Target.Repo]

# Configures the endpoint
config :target, TargetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6Y8z0OtfRWYDcI+MpAxSMVVEL+eXf/rFeylUg9/7tUtgYsVCdvdBV9kOsy82J0e4",
  render_errors: [view: TargetWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Target.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Target.Coherence.User,
  repo: Target.Repo,
  module: Target,
  web_module: TargetWeb,
  router: TargetWeb.Router,
  messages_backend: TargetWeb.Coherence.Messages,
  logged_out_url: "/",
  opts: [:authenticatable, :registerable, :recoverable]
# %% End Coherence Configuration %%

config :ueberauth, Ueberauth,
   providers: [
     facebook: { Ueberauth.Strategy.Facebook, [] }
   ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
    client_id: System.get_env("FACEBOOK_CLIENT_ID"),
    client_secret: System.get_env("FACEBOOK_CLIENT_SECRET"),
    redirect_uri: System.get_env("FACEBOOK_REDIRECT_URI")
