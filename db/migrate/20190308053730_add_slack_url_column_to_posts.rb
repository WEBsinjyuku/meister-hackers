class AddSlackUrlColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :slack_url, :string
  end
end
