class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :url
      t.text :description
      t.datetime :start_time
      t.timestamps
    end
  end
end
