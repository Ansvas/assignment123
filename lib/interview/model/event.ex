defmodule Interview.Model.Event do

  alias Interview.Schema.Event
  alias Interview.Repo
  def create(params) do
    event =
    %Event{}
    |> Event.changeset(params)
    |> Repo.insert()
    {:ok, event}
  end

  def all(event_name) do
    import Ecto.Query, only: [from: 2]
    from(e in "events",
      where: e.event_name == ^event_name,
      select: %{user_id: e.user_id, event_name: e.event_name, event_time: e.event_time, attributes: e.attributes})
    |> Repo.all()
  end

  def form_data(data) do
    Enum.map(data, fn item ->
      %{
        user_id: item.user_id,
        event_name: item.event_name,
        event_time: item.event_time,
        attributes: item.attributes
      }
    end)
  end
end
