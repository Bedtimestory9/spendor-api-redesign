defmodule SpendorWeb.CategoryJSON do
  alias Spendor.Category

  def index(%{categories: categories}) do
    %{data: for(category <- categories, do: data(category))}
  end

  defp data(%Category{} = category) do
    %{
      id: category.id,
      name: category.name
    }
  end
end
