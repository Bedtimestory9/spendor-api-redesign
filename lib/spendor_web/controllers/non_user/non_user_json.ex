# the name containing `JSON` is a must
defmodule SpendorWeb.NonUserJSON do
  alias Spendor.NonUser

  def show(%{non_user: non_user}) do
    %{data: data(non_user)}
  end

  defp data(%NonUser{} = non_user) do
    %{
      id: non_user.id,
      hashed_app_id: non_user.hashed_app_id
    }
  end
end
