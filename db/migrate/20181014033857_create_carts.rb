class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :user_type
      t.integer :user_id
      t.integer :total_price

      t.timestamps
    end
  end
end
