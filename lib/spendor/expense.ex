defmodule Spendor.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expenses" do
    field :item, :string
    field :amount, :decimal
    field :spent_at, :utc_datetime
    field :category_id, :id
    field :non_user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:amount, :spent_at, :item, :category_id, :non_user_id])
    |> validate_required([:amount, :spent_at, :item, :category_id, :non_user_id])
  end
end
