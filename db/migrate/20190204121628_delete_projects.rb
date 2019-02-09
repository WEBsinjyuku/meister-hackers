class DeleteProjects < ActiveRecord::Migration[5.2]
  def change
    drop_table :projects
  end
end
