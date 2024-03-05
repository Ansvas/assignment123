defmodule InterviewWeb.EventController do
  use InterviewWeb, :controller
  alias Interview.Model.Event

  def create_event(conn, params) do
    with {:ok, params} <- validate_event_params(params),
      Event.create(params) do
        conn
        |> json(%{msg: "created"})
    end
  end

  def get_events(conn, params) do
    data = Event.all(params["event_name"])
    conn
    |> json(%{msg: "success", data: data})
  end

  def validate_event_params(params) do
    with true <- Map.has_key?(params, "user_id"),
        true <- Map.has_key?(params, "event_name"),
        true <- Map.has_key?(params, "attributes") do
          {:ok, params}
        else
          _failed_case ->
            {:error, :improper_data}
        end
  end
end
