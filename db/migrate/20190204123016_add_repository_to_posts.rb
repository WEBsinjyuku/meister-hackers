class AddRepositoryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :repository, :string, null: false
  end
end
