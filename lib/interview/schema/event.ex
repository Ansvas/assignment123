defmodule Interview.Schema.Event do
  # define schema
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :user_id, :string
    field :event_time, :utc_datetime
    field :event_name, :string
    field :attributes, :map

    timestamps()
  end

  def changeset(event, attrs \\ %{}) do
    event
    |> cast(attrs, [:user_id, :attributes, :event_time, :event_name])
    |> validate_required([:user_id, :event_name, :attributes])
  end
end
