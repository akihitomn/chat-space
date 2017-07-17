class ChangeColumnToMesages < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :messages, :group_id, :integer, null: false
      change_column :messages, :user_id, :integer, null: false
    end

    def down
      change_column :messages, :group_id, :bigint, null: false
      change_column :messages, :user_id, :bigint, null: false
    end
  end
end
