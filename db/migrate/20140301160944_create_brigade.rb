class CreateBrigade < ActiveRecord::Migration
  def change
    create_table :brigades do |t|
      t.string :meetup_id
      t.string :name
      t.timestamps
    end
  end
end
