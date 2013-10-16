class CreateBrigadeBackendProjects < ActiveRecord::Migration
  def change
    create_table :brigade_backend_projects do |t|
      t.string :name, :url, :repository
      t.text :description
      t.timestamps
    end
  end
end
