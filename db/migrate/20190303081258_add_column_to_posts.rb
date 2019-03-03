class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :opened_on, :date
    add_column :posts, :closed_on, :date
  end
end
