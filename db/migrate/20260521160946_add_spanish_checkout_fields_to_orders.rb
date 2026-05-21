class AddSpanishCheckoutFieldsToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :country, :string
    add_column :orders, :postal_code, :string
    add_column :orders, :city, :string
  end
end
