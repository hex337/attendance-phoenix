defmodule AttendanceWeb.Resolvers.Members do
  import Ecto.Query
  alias Attendance.Repo

  def find_members(_parent, %{id: id}, _resolution) do
    {:ok, Repo.get_by(Attendance.Member, id: id)}
  end

  def find_members(_parent, %{query_string: query_string}, _resolution) do
    q_string = "%#{query_string}%"
    q = from(m in Attendance.Member,
      join: b in Attendance.Belt, on: b.id == m.belt_id,
      where: ilike(m.first_name, ^q_string),
      or_where: ilike(m.last_name, ^q_string),
      or_where: ilike(b.name, ^q_string),
      order_by: m.first_name,
      preload: [:belt])
    {:ok, Repo.all(q)}
  end
end
