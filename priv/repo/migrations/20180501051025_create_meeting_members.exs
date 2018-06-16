defmodule Attendance.Repo.Migrations.CreateMeetingMembers do
  use Ecto.Migration

  def change do
    create table(:meeting_members) do
      add :meeting_id, references(:meetings, on_delete: :nothing)
      add :member_id, references(:members, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)
      add :belt_id, references(:belts, on_delete: :nothing)

      timestamps()
    end

    create index(:meeting_members, [:meeting_id])
    create index(:meeting_members, [:member_id])
    create index(:meeting_members, [:role_id])
    create index(:meeting_members, [:belt_id])
  end
end
