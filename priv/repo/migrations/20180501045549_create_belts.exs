defmodule Attendance.Repo.Migrations.CreateBelts do
  use Ecto.Migration

  def change do
    create table(:belts) do
      add :name, :string
      add :comment, :string
      add :is_active, :boolean, default: false, null: false
      add :order_by, :integer

      timestamps()
    end

  end
end
