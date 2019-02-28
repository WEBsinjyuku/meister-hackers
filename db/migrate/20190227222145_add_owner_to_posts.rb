class AddOwnerToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :owner, :string
  end
end
