defmodule InsertNonUser do
  import Ecto.Query

  def insert do
    query = from n in Spendor.NonUser, where: n.hashed_app_id == "simulated_hashed_app_id"
    existed = Spendor.Repo.exists?(query)

    if !existed do
      changeset =
        Spendor.NonUser.changeset(%Spendor.NonUser{}, %{hashed_app_id: "simulated_hashed_app_id"})

      Spendor.Repo.insert!(changeset)
    else
      IO.puts("The test hashed_app_id has been inserted before.")
    end
  end
end

defmodule InsertCategories do
  import Ecto.Query

  def insert do
    categories = ["Food", "Transport", "Entertainment", "Shopping", "Utilities"]

    for n <- categories do
      query = from c in Spendor.Category, where: c.name == ^n
      existed = Spendor.Repo.exists?(query)

      if !existed do
        changeset =
          Spendor.Category.changeset(%Spendor.Category{}, %{
            name: n
          })

        Spendor.Repo.insert!(changeset)
      else
        IO.puts("The categories have been inserted previously.")
      end
    end
  end
end

defmodule InsertExpense do
  def insert do
    category_id = Spendor.Repo.get_by!(Spendor.Category, name: "Food").id

    non_user_id =
      Spendor.Repo.get_by!(Spendor.NonUser, hashed_app_id: "simulated_hashed_app_id").id

    changeset =
      Spendor.Expense.changeset(%Spendor.Expense{}, %{
        item: "snacks",
        amount: 3.00,
        spent_at: "2025-11-11T16:08:13.042407+01:00",
        category_id: category_id,
        non_user_id: non_user_id
      })

    Spendor.Repo.insert!(changeset)
  end
end

InsertNonUser.insert()
InsertCategories.insert()
InsertExpense.insert()
