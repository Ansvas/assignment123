defmodule InterviewWeb.PageController do
  use InterviewWeb, :controller

  def health(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    conn
    |> json(%{msg: "i am up"})
  end
end
