class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :info
      t.string :product_image
      t.integer :price
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
