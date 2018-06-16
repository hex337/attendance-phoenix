defmodule Attendance.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string
      add :comment, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
