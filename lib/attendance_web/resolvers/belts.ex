defmodule AttendanceWeb.Resolvers.Belts do
  alias Attendance.Repo

  def list_belts(_parent, _args, _resolution) do
    {:ok, Repo.all(Attendance.Belt)}
  end
end
