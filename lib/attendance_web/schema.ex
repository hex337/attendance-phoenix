defmodule AttendanceWeb.Schema do
  use Absinthe.Schema

  import_types AttendanceWeb.Schema.Types

  alias AttendanceWeb.Resolvers

  query do

    @desc "Get all belts"
    field :belts, list_of(:belt) do
      resolve &Resolvers.Belts.list_belts/3
    end

    @desc "Get members via query or id"
    field :members, list_of(:member) do
      arg :id, :id
      arg :query_string, :string
      arg :is_active, :boolean
      arg :is_teacher, :boolean
      arg :is_kid, :boolean
      resolve &Resolvers.Members.find_members/3
    end

    @desc "Get recent classes"
    field :meetings, list_of(:meeting) do
      arg :id, :id
      arg :limit, :integer
      resolve &Resolvers.Meetings.find_meetings/3
    end
  end
end
