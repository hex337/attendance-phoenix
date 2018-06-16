defmodule Attendance.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :slug, :string
      add :comment, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
