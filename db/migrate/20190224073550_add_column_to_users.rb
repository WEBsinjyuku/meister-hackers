class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_url, :string, null: false
  end
end
