class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :opened_at, :date
    add_column :posts, :closed_at, :date
  end
end
