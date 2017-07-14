class ChangeColumnToMessage < ActiveRecord::Migration[5.1]
  def up
    change_column :messages, :group_id, :bigint, null: false
    change_column :messages, :user_id, :bigint, null: false
  end

  def down
    change_column :messages, :group_id, :bigint, null: true
    change_column :messages, :user_id, :bigint, null: true
  end
end
