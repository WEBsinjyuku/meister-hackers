class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :area, null: true
      t.string :sex, null: true
      t.string :github_url, null: true
      t.string :twitter_url, null: true
      t.string :facebook_url, null: true
      t.string :blog_url, null: true
      t.string :introduction, null: true

      t.references :user
      t.timestamps
    end
  end
end
