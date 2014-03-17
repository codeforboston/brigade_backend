class DropBrigades < ActiveRecord::Migration
  
  def up
    drop_table :brigades
  end
end
