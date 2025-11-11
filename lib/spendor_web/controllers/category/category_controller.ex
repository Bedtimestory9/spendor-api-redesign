defmodule SpendorWeb.CategoryController do
  alias Spendor.Repo
  alias Spendor.Category
  use SpendorWeb, :controller

  def index(conn, _params) do
    categories = Repo.all(Category)
    render(conn, :index, categories: categories)
  end
end
