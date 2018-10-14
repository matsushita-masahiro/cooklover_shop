class CreateCartDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_details do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity
      t.integer :sell_price
      t.integer :subtotal

      t.timestamps
    end
  end
end
