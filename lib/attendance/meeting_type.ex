defmodule Attendance.MeetingType do
  use Ecto.Schema
  import Ecto.Changeset


  schema "meeting_types" do
    field :comment, :string
    field :is_active, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(meeting_type, attrs) do
    meeting_type
    |> cast(attrs, [:name, :comment, :is_active])
    |> validate_required([:name, :comment, :is_active])
  end
end
