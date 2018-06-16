defmodule Attendance.Repo.Migrations.CreateMeetings do
  use Ecto.Migration

  def change do
    create table(:meetings) do
      add :met, :naive_datetime
      add :comment, :string
      add :meeting_type_id, references(:meeting_types, on_delete: :nothing)
      add :school_id, references(:schools, on_delete: :nothing)

      timestamps()
    end

    create index(:meetings, [:meeting_type_id])
    create index(:meetings, [:school_id])
  end
end
