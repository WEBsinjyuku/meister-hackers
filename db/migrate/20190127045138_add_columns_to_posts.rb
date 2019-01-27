class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string, null: false
    add_column :posts, :content, :text, null: false
    add_reference :posts, :user, foreign_key: true, null: false
  end
end
