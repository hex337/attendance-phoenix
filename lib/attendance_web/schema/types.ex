defmodule AttendanceWeb.Schema.Types do
  use Absinthe.Schema.Notation
  import_types Absinthe.Type.Custom

  alias AttendanceWeb.Resolvers

  object :belt do
    field :id, :id
    field :comment, :string
    field :order_by, :integer
    field :name, :string
    field :is_active, :boolean
  end

  object :meeting do
    field :id, :id
    field :met, :naive_datetime
    field :comment, :string
    field :meeting_type, :meeting_type

    field :meeting_members, list_of(:meeting_member) do
      arg :limit, :integer
      resolve &Resolvers.MeetingMembers.list_meeting_members/3
    end
  end

  object :meeting_type do
    field :id, :id
    field :comment, :string
    field :is_active, :boolean
    field :name, :string
  end

  object :role do
    field :id, :id
    field :comment, :string
    field :is_active, :boolean
    field :name, :string
  end

  object :meeting_member do
    field :id, :id
    field :meeting, :meeting
    field :member, :member
    field :role, :role
    field :belt, :belt
  end

  object :member do
    field :id, :id
    field :comment, :string
    field :first_name, :string
    field :is_active, :boolean
    field :is_teacher, :boolean
    field :is_kid, :boolean
    field :last_name, :string
    field :belt, :belt

    field :meeting_members, list_of(:meeting_member) do
      arg :limit, :integer
      resolve &Resolvers.MeetingMembers.list_meeting_members/3
    end
  end
end
