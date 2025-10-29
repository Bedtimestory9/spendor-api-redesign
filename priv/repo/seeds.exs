# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Spendor.Repo.insert!(%Spendor.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# WARN: Do not run this more than once, it does not care validation
changeset =
  Spendor.NonUser.changeset(%Spendor.NonUser{}, %{hashed_app_id: "simulated_hashed_app_id"})

Spendor.Repo.insert!(changeset)
