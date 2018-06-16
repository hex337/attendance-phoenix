defmodule AttendanceWeb.Router do
  use AttendanceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    #resources "/users", AttendanceWeb.UserController, only: [:create, :show]
    post "/signup", AttendanceWeb.UserController, :create
    post "/signin", AttendanceWeb.UserController, :sign_in

    forward "/graphiql", 
      Absinthe.Plug.GraphiQL,
      schema: AttendanceWeb.Schema,
      interface: :simple

    forward "/",
      Absinthe.Plug,
      schema: AttendanceWeb.Schema
  end
end
