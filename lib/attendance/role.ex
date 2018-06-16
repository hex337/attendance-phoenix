defmodule Attendance.Role do
  use Ecto.Schema
  import Ecto.Changeset


  schema "roles" do
    field :comment, :string
    field :is_active, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :comment, :is_active])
    |> validate_required([:name, :comment, :is_active])
  end
end
