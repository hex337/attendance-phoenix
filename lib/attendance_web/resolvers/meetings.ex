defmodule AttendanceWeb.Resolvers.Meetings do
  import Ecto.Query
  alias Attendance.Repo

  def find_meetings(_parent, %{id: id}, _resolution) do
    {:ok, Repo.get_by(Attendance.Meeting, id: id)}
  end

  def find_meetings(_parent, %{limit: limit}, _resolution) do
    q = from(m in Attendance.Meeting,
      order_by: [desc: m.met],
      preload: [:meeting_type])
    {:ok, Repo.all(q)}
  end
end
