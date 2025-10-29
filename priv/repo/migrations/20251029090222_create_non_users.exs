defmodule Spendor.Repo.Migrations.CreateNonUsers do
  use Ecto.Migration

  def change do
    create table(:non_users) do
      add :hashed_app_id, :string

      timestamps(type: :utc_datetime)
    end
  end
end
