defmodule Spendor.Repo.Migrations.CreateUniqueIndexForHashedAppId do
  use Ecto.Migration

  def change do
    create unique_index("non_users", [:hashed_app_id])
  end
end
