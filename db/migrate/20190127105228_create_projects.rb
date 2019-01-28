class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :repository, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
