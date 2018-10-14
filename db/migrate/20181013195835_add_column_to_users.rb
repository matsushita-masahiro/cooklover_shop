class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :last_name, :string
      add_column :users, :first_name, :string
      add_column :users, :last_kana, :string
      add_column :users, :first_kana, :string
      add_column :users, :phone, :string
      add_column :users, :zip1, :string
      add_column :users, :zip2, :string
      add_column :users, :pref, :string
      add_column :users, :city, :string
      add_column :users, :addr1, :string
      add_column :users, :addr2, :string
  end
end
