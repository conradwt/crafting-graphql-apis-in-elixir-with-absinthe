defmodule PlateSlate.Ordering.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :customer_number, :integer
    field :items, :map
    field :ordered_at, :utc_datetime
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_number, :items, :ordered_at, :state])
    |> validate_required([:customer_number, :items, :ordered_at, :state])
  end
end
