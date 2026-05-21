class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :full_name
      t.string :email
      t.string :shipping_address
      t.string :payment_method
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :total

      t.timestamps
    end
  end
end
