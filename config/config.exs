# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :attendance,
  ecto_repos: [Attendance.Repo]

# Configures the endpoint
config :attendance, AttendanceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9gQr8kwekjAY+bfu0C6TrbsxwOqj+VIVqfYlAP+VupRUlRAeblhOoNpwSBpmEgro",
  render_errors: [view: AttendanceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Attendance.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Guardian
config :attendance, Attendance.Guardian,
       issuer: "Quantum Attendance",
       secret_key: "W8Rr+VAqZLqSexEgcnOyfkiDY2/AlkPapq/UKDNz5rESvbNQjoIWLMZ+ulaKJpbk"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
