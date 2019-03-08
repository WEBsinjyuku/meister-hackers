class AddSlackUrlColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :slack_channel, :string
  end
end
