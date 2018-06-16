defmodule Attendance.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :first_name, :string
      add :last_name, :string
      add :comment, :string
      add :is_active, :boolean, default: false, null: false
      add :is_teacher, :boolean, default: false, null: false
      add :is_kid, :boolean, default: false, null: false
      add :belt_id, references(:belts, on_delete: :nothing)
      add :school_id, references(:schools, on_delete: :nothing)

      timestamps()
    end

    create index(:members, [:belt_id])
    create index(:members, [:school_id])
  end
end
