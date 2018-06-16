defmodule Attendance.Repo.Migrations.CreateMeetingTypes do
  use Ecto.Migration

  def change do
    create table(:meeting_types) do
      add :name, :string
      add :comment, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
