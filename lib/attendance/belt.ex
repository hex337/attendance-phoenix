defmodule Attendance.Belt do
  use Ecto.Schema
  import Ecto.Changeset


  schema "belts" do
    field :comment, :string
    field :is_active, :boolean, default: false
    field :name, :string
    field :order_by, :integer

    timestamps()
  end

  @doc false
  def changeset(belt, attrs) do
    belt
    |> cast(attrs, [:name, :comment, :is_active, :order_by])
    |> validate_required([:name, :comment, :is_active, :order_by])
  end
end
