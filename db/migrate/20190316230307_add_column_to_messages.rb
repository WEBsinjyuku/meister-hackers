class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user_id, :bigint
  end
end
