class ChangeOrderDecimals < ActiveRecord::Migration[8.1]
  def change
    change_column :orders, :subtotal, :decimal, precision: 10, scale: 2
    change_column :orders, :shipping, :decimal, precision: 10, scale: 2
    change_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end