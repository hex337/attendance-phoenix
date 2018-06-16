defmodule AttendanceWeb.Resolvers.MeetingMembers do
  import Ecto.Query
  alias Attendance.Repo

  def list_meeting_members(%Attendance.Member{} = member, %{limit: limit}, _resolution) do
    q = from(mm in Attendance.MeetingMember,
      join: meeting in Attendance.Meeting, on: mm.meeting_id == meeting.id,
      where: mm.member_id == ^member.id,
      order_by: [desc: meeting.met],
      limit: ^limit,
      preload: [:meeting, :role, :meeting_type])
    {:ok, Repo.all(q)}
  end

  def list_meeting_members(%Attendance.Meeting{} = meeting, %{limit: limit}, _resolution) do
    q = from(mm in Attendance.MeetingMember,
      join: meeting in Attendance.Meeting, on: mm.meeting_id == meeting.id,
      where: mm.meeting_id == ^meeting.id,
      order_by: [desc: meeting.met],
      limit: ^limit,
      preload: [:member, :role, :meeting_type])
    {:ok, Repo.all(q)}
  end
end
