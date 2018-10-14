class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
      add_column :customers, :last_name, :string
      add_column :customers, :first_name, :string
      add_column :customers, :last_kana, :string
      add_column :customers, :first_kana, :string
      add_column :customers, :phone, :string
      add_column :customers, :zip1, :string
      add_column :customers, :zip2, :string
      add_column :customers, :pref, :string
      add_column :customers, :city, :string
      add_column :customers, :addr1, :string
      add_column :customers, :addr2, :string
  end
end
