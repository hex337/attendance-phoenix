defmodule Attendance.Member do
  use Ecto.Schema
  import Ecto.Changeset


  schema "members" do
    field :comment, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :is_kid, :boolean, default: false
    field :is_teacher, :boolean, default: false
    field :last_name, :string

    belongs_to :belt, Attendance.Belt
    belongs_to :school, Attendance.School

    has_many :meeting_members, Attendance.MeetingMember
    has_many :meetings, through: [:meeting_members, :member]

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:first_name, :last_name, :comment, :is_active, :is_teacher, :is_kid])
    |> validate_required([:first_name, :last_name, :comment, :is_active, :is_teacher, :is_kid])
  end
end
