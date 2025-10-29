defmodule SpendorWeb.NonUserController do
  alias Spendor.NonUser
  alias Spendor.Repo
  use SpendorWeb, :controller

  def show(conn, %{"id" => id}) do
    non_user = Repo.get(NonUser, id)
    render(conn, :show, non_user: non_user)
  end

  def create(attrs \\ %{}) do
    %NonUser{}
    |> NonUser.changeset(attrs)
    |> Repo.insert()
  end
end
