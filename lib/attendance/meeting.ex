defmodule Attendance.Meeting do
  use Ecto.Schema
  import Ecto.Changeset


  schema "meetings" do
    field :comment, :string
    field :met, :naive_datetime

    belongs_to :school, Attendance.School
    belongs_to :meeting_type, Attendance.MeetingType

    has_many :meeting_members, Attendance.MeetingMember
    has_many :members, through: [:meeting_members, :meeting]

    timestamps()
  end

  @doc false
  def changeset(meeting, attrs) do
    meeting
    |> cast(attrs, [:met, :comment])
    |> validate_required([:met, :comment])
  end
end
