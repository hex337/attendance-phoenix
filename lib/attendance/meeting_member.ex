defmodule Attendance.MeetingMember do
  use Ecto.Schema
  import Ecto.Changeset


  schema "meeting_members" do
    belongs_to :meeting, Attendance.Meeting
    belongs_to :member, Attendance.Member
    belongs_to :role, Attendance.Role
    belongs_to :belt, Attendance.Belt

    has_one :meeting_type, through: [:meeting, :meeting_type]

    timestamps()
  end

  @doc false
  def changeset(meeting_member, attrs) do
    meeting_member
    |> cast(attrs, [])
    |> validate_required([])
  end
end
