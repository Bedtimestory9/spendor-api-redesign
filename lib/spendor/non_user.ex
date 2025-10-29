defmodule Spendor.NonUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "non_users" do
    field :hashed_app_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(non_user, attrs) do
    non_user
    |> cast(attrs, [:hashed_app_id])
    |> validate_required([:hashed_app_id])
  end
end
