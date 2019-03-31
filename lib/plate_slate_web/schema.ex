# ---
# Excerpted from "Craft GraphQL APIs in Elixir with Absinthe",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/wwgraphql for more book information.
# ---
defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  import Ecto.Query, only: [from: 2]
  alias PlateSlate.{Menu, Repo}
  alias PlateSlateWeb.Resolvers

  query do
    @desc "The list of available items on the menu"
    field :menu_items, list_of(:menu_item) do
      arg(:matching, :string)

      resolve(&Resolvers.Menu.menu_items/3)
    end
  end

  @desc "Menu Item object"
  object :menu_item do
    @desc "The id for the item on the menu"
    field :id, :id

    @desc "The name of the item on the menu"
    field :name, :string

    @desc "The description for the item on the menu"
    field :description, :string

    @desc "The price for the item on the menu"
    field :price, :float
  end
end
