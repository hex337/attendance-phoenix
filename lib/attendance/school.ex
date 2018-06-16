defmodule Attendance.School do
  use Ecto.Schema
  import Ecto.Changeset


  schema "schools" do
    field :comment, :string
    field :is_active, :boolean, default: false
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:name, :slug, :comment, :is_active])
    |> validate_required([:name, :slug, :comment, :is_active])
  end
end
