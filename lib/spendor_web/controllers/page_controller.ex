defmodule SpendorWeb.PageController do
  use SpendorWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def api_home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    json(conn, %{url: "/api"})
  end
end
