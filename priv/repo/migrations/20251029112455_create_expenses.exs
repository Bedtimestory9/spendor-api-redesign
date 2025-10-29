defmodule Spendor.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :amount, :decimal
      add :spent_at, :utc_datetime
      add :item, :string
      add :non_user_id, references(:non_users, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:expenses, [:non_user_id])
    create index(:expenses, [:category_id])
  end
end
