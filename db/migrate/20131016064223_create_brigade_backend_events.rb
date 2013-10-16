class CreateBrigadeBackendEvents < ActiveRecord::Migration
  def change
    create_table :brigade_backend_events do |t|
      t.string :name, :url
      t.text :description
      t.datetime :start_time
      t.timestamps
    end
  end
end
