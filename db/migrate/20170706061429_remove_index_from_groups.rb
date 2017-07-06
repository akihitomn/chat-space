class RemoveIndexFromGroups < ActiveRecord::Migration[5.1]
  def change
    remove_index :groups, :name
  end
end
