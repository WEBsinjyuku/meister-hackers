class AddBosyuTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :bosyu_type, :integer, default: 1
  end
end
