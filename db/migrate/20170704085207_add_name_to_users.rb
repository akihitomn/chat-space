class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :text, null: false
    add_index :users, :name, unique: true
  end
end
